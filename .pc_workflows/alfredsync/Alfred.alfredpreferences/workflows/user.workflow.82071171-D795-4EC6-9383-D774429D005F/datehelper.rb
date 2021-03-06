#!/usr/bin/env ruby
#
#encoding: utf-8
#
#Author: wpc
#Email: qianjigui@gmail.com
#Created: 2015-09-11 23:04:14

require 'rubygems' unless defined? Gem
require 'alfred'
require 'date'

def day_of_month(y,m)
    Date.new(y,m,-1).day
end

def weekday_format(t)
    '%d/%s' % [t.day, t.strftime('%a')]
end

def week_range(t)
    res = []
    today = Date.today
    u = t.strftime('%u').to_i
    (1...u).each do |i|
        n = today+i-u
        res << weekday_format(n)
    end
    res << '*%s*' % [weekday_format(t)]
    ((u+1)..7).each do |i|
        n = today+i-u
        res << weekday_format(n)
    end
    '[%s]' % [res.join(',')]
end

def time2Item(t)
    title = t.strftime('%F %T %z %A')
    subtitle = '%s %s %.2fy %.2fm' % [t.strftime('%jd/%Vw'), week_range(t), t.yday/365.0, t.mday*1.0/day_of_month(t.year, t.month)]
    arg = '%s %s' % [title, subtitle]
    {title: title, subtitle: subtitle, arg: arg}
end

Alfred.with_friendly_error do |alfred|
  alfred.with_rescue_feedback = true

  fb = alfred.feedback

  data = ARGV[0]

  if ''==data
      t = Time.now

      fb.add_item(time2Item(t))
  else
      i = data.to_i
      [i/10**3,i,i/10**9].each do |i|
          fb.add_item(time2Item(Time.at(i)))
      end
  end

  puts fb.to_alfred
end
