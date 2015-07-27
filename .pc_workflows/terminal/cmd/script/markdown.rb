#!/usr/bin/env ruby
#
#encoding: utf-8
#
#Author: wpc
#Email: qianjigui@gmail.com
#Created: 2015-07-27 18:12:21

require 'redcarpet'

if ARGV.length != 2
    puts <<-END
    #{__FILE__} <input-markdown.md> <outfile.html>
    END
    exit 1
end

require 'pathname'
require 'fileutils'

CURRENT_DIR=Pathname.new(__FILE__).dirname

input=Pathname.new(ARGV[0])
output=Pathname.new(ARGV[1])

unless input.exist?
    puts 'input not found, please check it'
    exit 1
end

if output.exist?
    puts 'Output exist. Please rm it'
    exit 1
end

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, fenced_code_blocks:true )

File.open(output,'w') do |f|
    f.print markdown.render(File.read(input))
end
