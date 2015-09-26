# -*- coding: utf-8 -*-
import glob
import os
import re
import sqlite3
import time

import alfred

_MAX_RESULTS = 20
_CACHE_EXPIRY = 24 * 60 * 60 # in seconds
_CACHE = alfred.work(True)

def combine(operator, iterable):
    return u'(%s)' % (u' %s ' % operator).join(iterable)

def icon(db, faviconid):
    if not faviconid:
        return
    data = db.execute(u'select data from moz_favicons where id=%d' % faviconid).fetchone()
    if not data:
        return
    icon = os.path.join(_CACHE, 'icon-%d.png' % faviconid)
    if (not os.path.exists(icon)) or ((time.time() - os.path.getmtime(icon)) > _CACHE_EXPIRY):
        open(icon, 'wb').write(data[0])
    return icon

def places(profile):
    profile = (d for d in glob.glob(os.path.expanduser(profile)) if os.path.isdir(d)).next()
    return os.path.join(profile, 'places.sqlite')

def regexp(pattern, item):
    return item and bool(re.match(pattern, item, flags=re.IGNORECASE))

def results(db, query):
    db.create_function("regexp", 2, regexp)
    found = set()
    ss = sql(query)
    for result in db.execute(ss):
        if result in found:
            continue
        found.add(result)
        (uid, title, url, faviconid) = result
        yield alfred.Item({u'uid': alfred.uid(uid), u'arg': url}, title, url, icon(db, faviconid))

def sql(query):
    history = u"""\
select distinct moz_places.id, moz_places.title, moz_places.url, moz_places.favicon_id from moz_places
where (%s) AND (%s) ORDER BY moz_places.last_visit_date DESC LIMIT 9""" % (where(query, [u'moz_places.title', u'moz_places.url']), filterout(query) )
    return history

def where(query, fields):
    return combine(u'or', ('%s regexp "%s"' % (field, '.*%s' % '.*'.join(re.escape(c) for c in query.split(' '))) for field in fields))

def filterout(query):
    return u""" NOT ( \
        (moz_places.url LIKE '%www.baidu.com%' ) \
        OR (moz_places.url LIKE '%www.google.com%' ) \
        )"""

(profile, query) = alfred.args()
query = query.strip()
db = sqlite3.connect(places(profile))
alfred.write(alfred.xml(results(db, query), maxresults=_MAX_RESULTS))
