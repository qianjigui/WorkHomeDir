#!/usr/bin/env ruby
#
#encoding: utf-8
#
#Author: wpc
#Email: qianjigui@gmail.com

if ARGV.length != 2
    puts <<-END
    Usage:
        #{__FILE__} <ShortCut.yml> <Query>
    END
    exit 1
end

require 'rubygems' unless defined? Gem
require 'alfred'
require 'pathname'
require 'fileutils'
require 'yaml'

cfg = ARGV[0]
query=ARGV[1]

data = YAML.load_file(cfg)

class ShortCut
    attr_reader :arg, :keys, :weight, :name, :path
    def initialize(name, parent, cfg, nodes, weight)
        @parent = parent
        @nodes = nodes
        @cfg = cfg
        @arg = value
        @path= cpath
        @keys= labels(name)
        if @parent
            @name = @parent.name + '/' + name
        else
            @name = name
        end
        @weight=weight
    end

    def arg?
        not @nodes
    end

    def labels(name)
        keys = {}
        keys[name] = true
        if @parent
            @parent.keys.keys.each {|k| keys[k] = true}
        end
        keys
    end

    def cpath
        v = @cfg['path']
        unless v
            v = 'undefined'
        end
        if @parent
            v = '%s/%s' % [@parent.path, v]
        end
        v
    end

    def value
        v = @cfg['arg']
        unless v
            if @parent
                v = @parent.path + '/'
            else
                v = ''
            end
            v = '%s%s' % [v, @cfg['path'] ]
        end
        v
    end

    def nodes
        v = []
        if @nodes
            @nodes.each_with_index do |n, i|
                i = ShortCut.new(n['name'], self, n['cfg'], n['nodes'], @weight*100+i)
                v << i
                v = v + i.nodes
            end
        end
        v
    end

    def to_s
        '%s(%d) : %s' % [@keys.keys.join(','), @weight, @arg]
    end

    def <=>(b)
        @weight<=>b.weight
    end
end

i = ShortCut.new('', nil, data['cfg'], data['nodes'], 1)

nodes = i.nodes

words = []
query.split(' ').each do |i|
    if i!=''
        words << i.strip
    end
end

res = []
nodes.each do |n|
    f = true
    words.each do |w|
        unless n.keys[w]
            f = false
            break
        end
    end
    if f
        res << n
    end
end
if res.size==0
    res = nodes
end
res.sort!

Alfred.with_friendly_error do |alfred|
  alfred.with_rescue_feedback = true

  fb = alfred.feedback

  res.each do |r|
      fb.add_item({title: r.name, subtitle: r.arg, arg: r.arg})
  end

  puts fb.to_alfred
end

