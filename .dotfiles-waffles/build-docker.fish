#!/usr/bin/env fish

docker build -t (basename $PWD) -f .dotfiles-waffles/Dockerfile .
