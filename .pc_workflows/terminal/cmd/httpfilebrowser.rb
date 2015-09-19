#!/usr/bin/env ruby
#
#encoding: utf-8
#
#Author: wpc
#Email: qianjigui@gmail.com
#Created: 2015-09-18 12:00:53

require 'webrick'
WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start

