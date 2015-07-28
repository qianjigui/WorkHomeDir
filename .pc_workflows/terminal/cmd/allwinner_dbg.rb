#!/usr/bin/env ruby
#
#encoding: utf-8
#

require_relative 'script/util'

if ARGV.length<1
    Log.i('Please input: [chip=a31/a20] <module=services/framework>')
    exit 1
end

case ARGV[0].downcase
when 'a31'
    chip = 'a31'
when 'a20'
    chip = 'a20'
else
    chip = 'a31'
end


