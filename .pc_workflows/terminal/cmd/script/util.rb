#!/usr/bin/env ruby
#
#encoding: utf-8
#

require 'open3'

class Log
    def self.i(*msg)
        puts '[INFO] %s' % msg.join(' ')
    end

    def self.d(*msg)
        puts '[DEBUG] %s' % msg.join(' ')
    end

    def self.e(*msg)
        puts '[ERROR] %s' % msg.join(' ')
    end
end

class Runner
    @@instance = Runner.new
    def self.I
        @@instance
    end
    def cmd(cmd)
        stdin, stdout, stderr, wait_thr = Open3.popen3(cmd)
        pid = wait_thr[:pid]  # pid of the started process
        stdin.close  # stdin, stdout and stderr should be closed explicitly in this form.
        out = stdout.read
        stdout.close
        err = stderr.read
        stderr.close
        exit_status = wait_thr.value  # Process::Status object returned.
        case exit_status
        when 0
            out
        else
            Log.i('Run ', cmd, 'exit', exit_status)
            Log.d("STDOUT", out)
            Log.d("STDERR", err)
            exit exit_status
        end
    end

    def check_todo(list, question, answer, summary)
        todo = []
        list.each do |item|
            pattern = question.call(item)
            input = gets.chomp
            case input
            when pattern
                todo << {:data => item, :input=>input}
            end
            puts '---------------------'
        end
        s = []
        if todo.size > 0
            todo.each do |item|
                s << summary.call(item)
            end
            puts '--------------------'
            print s.join()
            puts '--------------------'
            print '* To Run: [yes], n[o]'
            case gets.chomp
            when /^n/i
                Log.i('No run')
            when
                todo.each do |item|
                    answer.call(item)
                end
            end
        end
    end
end

