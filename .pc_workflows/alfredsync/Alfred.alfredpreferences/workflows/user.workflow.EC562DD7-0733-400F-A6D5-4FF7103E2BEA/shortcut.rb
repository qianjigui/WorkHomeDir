#!/usr/bin/env ruby
#
#encoding: utf-8
#
#Author: wpc
#Email: qianjigui@gmail.com

if ARGV.length != 4
    puts <<-END
    Usage:
        #{__FILE__} <ShortCut.yml> <History> <Query> <u/q>
        u: update timestamp
        q: query
    END
    exit 1
end

require 'yaml'

cfg = ARGV[0]
timestamp=ARGV[1]
times=nil
begin
    times = YAML.load_file(timestamp)
rescue => e
    times = {}
end
query=ARGV[2]
opt  =ARGV[3]

if opt.downcase=='u'
    times[query] = Time.now.strftime('%s').to_i
    File.open(timestamp, 'w') do |f|
        f.print times.to_yaml
    end
    exit 0
end

require 'rubygems' unless defined? Gem
require 'alfred'
data = YAML.load_file(cfg)

class ShortCut
    attr_reader :arg, :keys, :weight, :name, :path, :time
    def initialize(name, parent, cfg, nodes, weight, times)
        @parent = parent
        @nodes = nodes
        @cfg = cfg
        @path= cpath
        @arg = value
        @keys= labels(name)
        if @parent
            @name = @parent.name + '/' + name
        else
            @name = name
        end
        @weight=weight
        @time = times[@arg] || 0
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

    def nodes(times)
        v = []
        if @nodes
            @nodes.each_with_index do |n, i|
                i = ShortCut.new(n['name'], self, n['cfg'], n['nodes'], @weight*100+i, times)
                v << i
                v = v + i.nodes(times)
            end
        end
        v
    end

    def to_s
        '%s(%d) : %s' % [@keys.keys.join(','), @weight, @arg]
    end

    def <=>(b)
        [-@time, @weight]<=>[-b.time, b.weight]
    end
end

i = ShortCut.new('', nil, data['cfg'], data['nodes'], 1, times)

nodes = i.nodes(times)

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
        found  = false
        n.keys.keys.each do |k|
            if k.include?(w)
                found = true
                break
            end
        end
        unless found
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

  res.each_with_index do |r,i|
      fb.add_item({title: r.name, subtitle: r.arg, arg: r.arg, icon: {name: ('%s/.pc_workflows/alfredsync/Alfred.alfredpreferences/resources/numbers/animal_number_%d.png' % [ENV['HOME'], i+1])}})
  end

  puts fb.to_alfred
end

