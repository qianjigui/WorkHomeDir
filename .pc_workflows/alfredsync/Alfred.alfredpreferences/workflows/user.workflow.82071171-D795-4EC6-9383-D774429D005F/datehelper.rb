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

Alfred.with_friendly_error do |alfred|
  alfred.with_rescue_feedback = true

  fb = alfred.feedback

  t = Time.now

  title = t.strftime('%F %T %z %A')
  subtitle = '%s %.2fyear %.2fmonth' % [t.strftime('%jd/%Vw'), t.yday/365.0, t.mday*1.0/day_of_month(t.year, t.month)]
  arg = '%s %s' % [title, subtitle]

  fb.add_item({title: title, subtitle: subtitle, arg: arg})

  puts fb.to_alfred
end
