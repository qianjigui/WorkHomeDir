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

CHAR_MAP={
   '！' => '! ',
   '＠' => '@',
   '＃' => '#',
   '＄' => '$',
   '％' => '%',
   '＾' => '^',
   '＆' => '&',
   '＊' => '*',
   '（' => '(',
   '）' => ')',
   '＿' => '_',
   '＋' => '+',
   '｜' => '|',
   '～' => '~',
   '－' => '-',
   '＝' => '=',
   '＼' => '\\',
   '· ' => '`',
   '｛' => '{',
   '｝' => '}',
   '［' => '[',
   '］' => ']',
   '：' => ': ',
   '＂' => '"',
   '；' => '; ',
   '＇' => '\'',
   '＜' => '<',
   '＞' => '>',
   '？' => '? ',
   '，' => ',',
   '／' => '/',
   '．' => '. ',
   '。' => '. ',
   '《' => '< ',
   '「' => ' \'',
   '」' => '\' ',
   '》' => ' >',
}

#data=File.read(ARGV[0])
data=(ARGV[0])
#From alfred, the string encoding is ASCII-8BIT.
#We need to convert to UTF-8
data=data.dup.force_encoding('UTF-8')

data.each_char do |i|
    d = CHAR_MAP[i]
    d = i unless d
    print d
end
