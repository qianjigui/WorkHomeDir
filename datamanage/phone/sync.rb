#!/usr/bin/ruby
#
#Sync directory by mapping
#
#  Sync local data to remote data
#

require 'yaml'
require 'fileutils'

class LocalLs
    def ls(dir)
        Dir.glob(dir+'/**/**').select do |f|
            isDir = File.directory?(f)
            (not isDir) and (not (f=~/jpeg|jpg|png\Z/))
        end
    end
end

MAPPING = YAML.load_file('map.yml')

CONFIG=MAPPING[:config]
LOCAL=CONFIG[:local]+'/'
REMOTE=CONFIG[:remote]+'/'

MAP_LIST=MAPPING[:map]

ls = LocalLs.new
MAP_LIST.each do |map|
    local = map[:local]
    remote= map[:remote]
    lmap = {}
    ls.ls(LOCAL+local).each do |f|
        r = REMOTE+remote+f.sub(LOCAL+local, '')
        lmap[r] = {:local=>f, :exist => false}
    end
    ls.ls(REMOTE+remote).each do |f|
        status = lmap[f]
        if status
            status[:exist] = true
        end
    end
    lmap.each_pair do |r,status|
        unless status[:exist]
            FileUtils.mkdir_p(File.dirname(r))
            puts status[:local]+' to '+ r
            FileUtils.cp(status[:local], r)
        end
    end
end
