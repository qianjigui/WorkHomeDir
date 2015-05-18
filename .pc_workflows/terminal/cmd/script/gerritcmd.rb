#!/usr/bin/env ruby
#
#encoding: utf-8
#

#http://opencode.alibaba-inc.com:8080/Documentation/cmd-index.html

require_relative 'util'
require 'json'

class CMD
    def initialize(port, host)
        @port = port
        @host = host
    end

    def query(*args)
        cmd = 'ssh -p %s %s gerrit query --format=JSON %s' % [@port, @host, args.join('  ')]
        run(cmd)
    end

    def run(cmd)
        data = Runner.I.cmd(cmd)
        JSON.parse(data)
    end
end

c = CMD.new(29418, 'opencode.alibaba-inc.com')

p c.query('status:merged', 'limit:3')
