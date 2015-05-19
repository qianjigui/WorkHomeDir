#!/usr/bin/env ruby
#
#encoding: utf-8
#

#http://opencode.alibaba-inc.com:8080/Documentation/cmd-index.html

require_relative 'util'
require 'json'
require 'date'

class Gerrit
    def initialize(port, host)
        @port = port
        @host = host
    end

    def query(*args)
        cmd = 'ssh -p %s %s gerrit query --format=JSON --patch-sets %s' % [@port, @host, args.join('  ')]
        run(cmd)
    end

    def run(cmd)
        cmd.strip!
        data = Runner.I.cmd(cmd)
        res = []
        data.split("\n").each do |d|
            r = JSON.parse(d)
            case r['type']
            when 'stats'
                Log.i('Cost', r['runTimeMilliseconds'], 'ms')
            when 'error'
                Log.e(r)
            else
                res << r
            end
        end
        return res
    end

    def ago(t)
        @now ||= Time.now
        DateTime.strptime((@now-Time.at(t)).to_s, '%s').strftime('%T')
    end

    def commit(input, item)
        sets = item['patchSets']
        idx = 0
        case input
        when /^\d+/
            idx = input.to_i-1
        end
        set = sets[idx]
        '%s,%s' % [item['number'], set['number']]
    end

    def submit(data)
        @now = Time.now
        question = Proc.new do |item|
            print <<-END
Submit to P[#{item['project']}] B(#{item['branch']})
Subject:
   #{item['subject']}
            END
            pattern = /^y(es)?/i
            if item['patchSets'].size > 1
                puts 'PatchSets'
                idx = 1
                item['patchSets'].each do |set|
                    puts '%d: CreatedOn %s ago' % [idx, ago(set['createdOn'])]
                    idx += 1
                end
                pattern=/^\d+/
                print '* Choose: 1..%d: ' % [idx-1]
            else
                print '* Choose: n[o], [yes]: '
            end
            pattern
        end
        answer = Proc.new do |data|
            item = data[:data]
            input = data[:input]
            cmd = 'ssh -p %s %s gerrit review --code-review +2 --message \'"Submit by gerritbatch @ pcwf"\' --submit %s'
            cmd = cmd % [@port, @host, commit(input, item)]
            run(cmd)
        end
        summary = Proc.new do |data|
            item = data[:data]
            res = <<-END
P[#{item['project']}] B(#{item['branch']})
 S:#{item['subject']}
            END
            input = data[:input]
            case input
            when /^y(es)?/
            when /^\d+/
                set = item['patchSets'][input.to_i - 1]
                res += <<-END
  PatchSet: #{input}. CreatedOn #{ago(set['createdOn'])} ago
                END
            end
        end
        Runner.I.check_todo(data, question, answer, summary)
    end
end
