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
        out = stdout.gets
        stdout.close
        err = stderr.gets
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
end
