package main

import (
	ff "5wpc.info/alfredff/history"
	"flag"
)

var query = flag.String("query", " ", "History Query")
var db = flag.String("db", "~/Library/Application Support/Firefox/Profiles", "Firefox data directory path")
var cache = flag.String("cache", "/tmp/", "Firefox data directory path")
var bundleid = flag.String("bundleid", "5wpc.info-firefoxalfredhistory", "Alfred BundleId")

func main() {
	flag.Parse()
	path := ff.Db(*db)
	ff.Response(*query, path, *cache, *bundleid)
}
