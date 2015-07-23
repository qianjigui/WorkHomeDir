#!/usr/bin/env ruby
#
#encoding: utf-8
#

require 'open3'
require 'yaml'
require 'pathname'

class UIHelper
    SPLIT='-'
    def self.split
        puts SPLIT*70
    end

    NEXT='* '
    def self.next
        puts NEXT*3
    end

    def self.msg(*args)
        print args.join('  ')
    end

    def self.msgln(*args)
        puts args.join('  ')
    end
end
class Log
    def self.i(*msg)
        UIHelper.msgln '[INFO] %s' % msg.join(' ')
    end

    def self.d(*msg)
        UIHelper.msgln '[DEBUG] %s' % msg.join(' ')
    end

    def self.e(*msg)
        UIHelper.msgln '[ERROR] %s' % msg.join(' ')
    end
end
module GlobalConfig
    extend self
    def init(path)
        @@config = YAML.load_file(path)
    end
    def [](v)
        @@config[v]
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
            Log.d("STDERR", err)
            out
        else
            Log.i('Run ', cmd, 'exit', exit_status)
            Log.d("STDOUT", out)
            Log.d("STDERR", err)
            exit exit_status.to_i
        end
    end

    #list: data array
    #question: Proc.new
    #          argument: 1, the item on the list
    #          return: Pass pattern(regular)
    #          Print a message to user for getting input
    #summery: Proc.new
    #         argument: 1, the item on the list
    #         Print a summary  message for this pass item
    #answer: Proc.new
    #        argument: 1, {:data=>the item on the list, :input=>user input data}
    #        Do the process on this pass item
    #
    def check_todo(list, question, answer, summary)
        todo = []
        list.each do |item|
            pattern = question.call(item)
            input = $stdin.gets.chomp
            case input
            when pattern
                todo << {:data => item, :input=>input}
            end
            UIHelper.next
        end
        s = []
        if todo.size > 0
            UIHelper.split
            todo.each do |item|
                s << summary.call(item)
            end
            UIHelper.msgln(s.join())
            UIHelper.msg('* To Run: [yes], n[o]')
            case $stdin.gets.chomp
            when /^n/i
                Log.i('No run')
            when
                todo.each do |item|
                    answer.call(item)
                    UIHelper.msgln 'OK'
                end
            end
        end
    end
end

GlobalConfig.init(Pathname.new(__FILE__).dirname+'../.config.yml')
