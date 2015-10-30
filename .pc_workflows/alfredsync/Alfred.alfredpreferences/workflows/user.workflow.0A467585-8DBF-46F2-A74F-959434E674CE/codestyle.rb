#!/usr/bin/env ruby
#
#encoding: utf-8
#
#Author: wpc
#Email: qianjigui@gmail.com

if ARGV.length != 1
    puts <<-END
    Usage:
        #{__FILE__} <data>
    END
    exit 1
end

from=%q(！＠＃＄％＾＆＊（）＿＋｜～－＝＼·｛｝［］：＂；＇＜＞？，．／。).chars
to=[
    '! ',
    '@',
    '#',
    '$',
    '%',
    '^',
    '&',
    '*',
    '(',
    ')',
    '_',
    '+',
    '|',
    '~',
    '-',
    '=',
    '\\',
    '`',
    '{',
    '}',
    '[',
    ']',
    ': ',
    '"',
    '; ',
    '\'',
    '<',
    '>',
    '? ',
    ',',
    '. ',
    '/',
    '. ',
]

if from.size != to.size
    puts 'Error Mapping'
    exit 1
end

#data=File.read(ARGV[0])
data=(ARGV[0])
#From alfred, the string encoding is ASCII-8BIT.
#We need to convert to UTF-8
data=data.dup.force_encoding('UTF-8')

map={}
from.each_with_index do |k,i|
    #puts '%s->%s' % [k,to[i]]
    map[k]=to[i]
end

data.each_char do |i|
    d = map[i]
    d = i unless d
    print d
end
