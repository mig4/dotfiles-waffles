#!/usr/bin/env fish

# pipsi and vex

if test ! -d ~/.local/venvs
  mkdir -p ~/.local/venvs
end

if not command -v vex
  pip install --user vex
end

# fisherman

if test ! -f ~/.config/fish/functions/fisher.fish
  curl -fL --create-dirs \
    -o ~/.config/fish/functions/fisher.fish https://git.io/fisher
end

# for some reason when this runs during `docker build` just plain
# `fisher` command doesn't find the fishfile
fisher < ~/.config/fish/fishfile
