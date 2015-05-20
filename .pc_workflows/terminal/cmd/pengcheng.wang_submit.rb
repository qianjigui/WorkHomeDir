#!/usr/bin/env ruby
#
#encoding: utf-8
#

require_relative 'script/gerritcmd'

if ARGV.length!=2
    Log.i('Please input: port url')
    exit 1
end

port = ARGV[0]
url = ARGV[1]
c = Gerrit.new(port, url)
data = c.query('status:open', 'owner:pengcheng.wang')
c.submit(data)

