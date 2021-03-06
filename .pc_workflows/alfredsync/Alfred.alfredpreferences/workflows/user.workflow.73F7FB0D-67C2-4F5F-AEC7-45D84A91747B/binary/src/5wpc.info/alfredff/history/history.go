package history

import (
	alfred "5wpc.info/alfredff/alfred"
	"database/sql"
	"fmt"
	_ "github.com/mattn/go-sqlite3"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"strings"
	"time"
)

type Place struct {
	id         sql.NullInt64
	url        sql.NullString
	title      sql.NullString
	favicon_id sql.NullInt64
}

func (p Place) String() string {
	return fmt.Sprintf("[%s](%s) %d ", p.title.String, p.url.String, p.favicon_id.Int64)
}

func IconPath(cachedir string, id int64) string {
	return fmt.Sprintf("%s/icon-%d.png", cachedir, id)
}

var NOW = time.Now().UnixNano()

var CAHCE_ICON_DURATION = int64(time.Second * time.Duration(60*60*24))

func CacheIcon(cachedir string, id int64, data sql.RawBytes) string {
	path := IconPath(cachedir, id)
	is_new := true
	if fi, err := os.Stat(path); err == nil {
		if (fi.ModTime().UnixNano() + CAHCE_ICON_DURATION) >= NOW {
			is_new = false
		}
	}
	if is_new {
		ioutil.WriteFile(path, data, 0644)
	}
	return path
}

func Db(path string) string {
	matches, err := filepath.Glob(fmt.Sprintf("%s/*/places.sqlite", path))
	if err != nil {
		log.Panicln(err)
	}
	return matches[0]
}

func IconKey(id int64, icons map[int64]string) string {
	if val, ok := icons[id]; ok {
		return val
	} else {
		return ""
	}
}

var ESCAPE_CHARS = []string{" ", ";", "(", ")"}

func Unescape(v string) string {
	res := v
	for i := 0; i < len(ESCAPE_CHARS); i++ {
		res = strings.Replace(res, ESCAPE_CHARS[i], "\\"+ESCAPE_CHARS[i], -1)
	}
	return res
}

func Response(query, path, cachedir, bundleid string) {
	db, err := sql.Open("sqlite3", path)
	if err != nil {
		log.Panic(err)
	}

	query = strings.Join(strings.Split(strings.TrimSpace(query), " "), "%")

	stmt := fmt.Sprintf(`
	SELECT moz_places.id, moz_places.title, moz_places.url, moz_places.favicon_id
	FROM moz_places
	WHERE ((moz_places.title LIKE '%%%s%%' OR moz_places.url LIKE '%%%s%%'))
	AND ( NOT (
		   (moz_places.url LIKE '%%www.baidu.com%%' )
		OR (moz_places.url LIKE '%%www.google.com/search?q=%%' )
		OR (moz_places.url LIKE '%%www.google.com/url?%%' )
		OR (moz_places.url LIKE 'file://%%')
	) )
	GROUP BY moz_places.title
	ORDER BY max(moz_places.last_visit_date) DESC LIMIT 9`,
		query, query)

	rows, err := db.Query(stmt)

	if err != nil {
		log.Panic(err)
	}

	places := make([]Place, 0)
	ids := make([]string, 0)
	for rows.Next() {
		place := new(Place)
		err := rows.Scan(
			&place.id,
			&place.title,
			&place.url,
			&place.favicon_id,
		)
		if err != nil {
			log.Println(rows.Columns, err)
		}
		places = append(places, *place)
		ids = append(ids, fmt.Sprintf("%d", place.favicon_id.Int64))
	}
	rows.Close()
	l := strings.Join(ids, ",")
	rows, err = db.Query(fmt.Sprintf("SELECT id,data FROM moz_favicons WHERE id in (%s);", l))
	icons := make(map[int64]string)
	for rows.Next() {
		var id sql.NullInt64
		var data sql.RawBytes
		err := rows.Scan(
			&id,
			&data,
		)
		if err != nil {
			log.Println(rows.Columns, err)
		}
		icons[id.Int64] = CacheIcon(cachedir, id.Int64, data)
	}
	rows.Close()
	size := len(places)

	resp := alfred.NewResponse()
	if strings.EqualFold("", query) {
		BLANK_PAGE_ITEM := new(alfred.AlfredResponseItem)
		BLANK_PAGE_ITEM.Arg = "$HOME/Downloads"
		BLANK_PAGE_ITEM.Title = "Blank Page"
		resp.AddItem(BLANK_PAGE_ITEM)
	}
	for i := 0; i < size; i++ {
		place := places[i]
		item := new(alfred.AlfredResponseItem)
		item.Arg = place.url.String
		item.Uid = fmt.Sprintf("%s%d", bundleid, place.id.Int64)
		item.Title = place.title.String
		item.Subtitle = item.Arg
		item.Icon = IconKey(place.favicon_id.Int64, icons)
		resp.AddItem(item)
	}
	resp.Print()
}
