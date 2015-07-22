#!/usr/bin/env ruby
#
#encoding: utf-8
#

#gem install jenkins_api_client
require_relative 'util'
require 'jenkins_api_client'
require 'yaml'

class JenkinsJob
    def initialize(config, job_name)
        @client = JenkinsApi::Client.new(config)
        @name = job_name
    end
    def build(params)
        id = @client.job.build(@name, params,
                                   {
            'build_start_timeout'=>15,
            'cancel_on_build_start_timeout' => true,
            'poll_interval' => 2,
        })
        is_finish = false
        while !is_finish
            sleep 3
            Log.d 'Wating for Build %s %d' % [@name, id]
            is_finish= @client.job.get_build_details(@name, id)['building']
        end
        id
    end
    def latest
        builds = @client.job.get_builds(@name)
        i = builds[0]
        [i['number'],i['url']]
    end
    def output(id)
        @client.job.get_console_output(@name, id)['output']
    end
    def pretty_print(pp)
        pp.pp 'JenkinsJob:%s' % [@name]
    end
    def to_s
        'JenkinsJob:%s' % [@name]
    end
end

