#!/usr/bin/env ruby
#
#encoding: utf-8
#

require_relative 'script/gitcmd'

c = Git.new
c. push_for_review
