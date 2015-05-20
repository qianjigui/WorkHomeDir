#!/usr/bin/env ruby
#
#encoding: utf-8
#

require_relative 'script/gerritcmd'

c = Gerrit.new(29418, 'opencode.alibaba-inc.com')
data = c.query('status:open', 'owner:pengcheng.wang')
c.submit(data)

