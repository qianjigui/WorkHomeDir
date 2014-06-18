#!/bin/bash

# http://www.cnblogs.com/bamboo-talking/archive/2013/01/07/2848914.html

LIST="tmux git global \
    texlive-xetex latex-cjk-xcjk cjk-latex latex-cjk-chinese \
    graphviz"

for i in $LIST
do
    echo $i
    sudo apt-get install $i
done
