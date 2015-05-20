#!/usr/bin/env ruby
#
#encoding: utf-8
#

require_relative 'util'
require 'json'
require 'date'

class Git
    def initialize
    end

    #± % git branch -vv
    #    master         e1cd614 [origin/master] support rtd1815 and rtd1805
    #  * xxx            f8a967c Make test commonfota prop
    #    yunos/4.4/dev2 f8a967c [origin/yunos/4.4/dev2: ahead 1] Make test commonfota prop
    #
    #
    def get_track_branch
        out = Runner.I.cmd('git branch -vv')
        res = nil
        out.split("\n").each do |line|
            if line =~ /^\* (\S+)\s+(\S{7}) \[([^\s\/]+)\/(\S+): ([^\]]+)\]/i
                r = Regexp.last_match
                res = {:branch=>r[1], :remote=>r[3], :remote_branch=>r[4]}
            end
        end
        res
    end

    def push_for_review
        br = get_track_branch
        if br
            cmd = 'git push %s %s:refs/for/%s' % [br[:remote], br[:branch], br[:remote_branch]]
            Log.i(Runner.I.cmd(cmd))
        else
            Log.i('No Change/upstream branch. Please press (git branch -vv) to check')
        end
    end
end

