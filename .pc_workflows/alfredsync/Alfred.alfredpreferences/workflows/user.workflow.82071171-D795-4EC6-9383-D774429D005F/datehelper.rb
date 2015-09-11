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

Alfred.with_friendly_error do |alfred|
  alfred.with_rescue_feedback = true

  fb = alfred.feedback

  t = Time.now

  fb.add_item({title: t, subtitle: '%dth of week cost %f in this year' % [t.wday, t.yday/365.0]})
  fb.add_item({title: '%dth day' % [t.yday], subtitle: '%dth week' % [(t.yday+6)/7]})

  puts fb.to_alfred
end
