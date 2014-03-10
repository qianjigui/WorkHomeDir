#!/bin/bash

AAA=$PWD
tmux neww "cd \"$AAA\"; exec zsh"
