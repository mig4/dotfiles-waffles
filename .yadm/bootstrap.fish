#!/usr/bin/env fish

# fisherman

# TODO disable fisher for now, can't get it to work after v3 update:
#   - jorgebucaran/fisher#514 reinstalls everything every time causing a lot
#     of churn
#   - there's some bug where anything piped to `_fisher_parse -R` (like in
#     `_fisher_commit` or `fisher ls`) returns nothing, causing fisher to
#     to quite often actually remove everything (specifically it only works
#     when called with all packages every time, i.e.
#     `fisher add < ~/.config/fish/fishfile`)
#   - some packages I used are missing after dissolving fisherman
#     (jorgebucaran/fisher#446): debug, g2
#   - it's unclear what the future of fisher is - jorgebucaran/fisher#443
#     (it appears the author wants to strip it down / turn it into something
#     rather different with no plugin/dependency management, etc.)
# TODO look for an alternative to fisher
#   - there's https://github.com/oh-my-fish/oh-my-fish but I rather preferred
#     fisher's lean approach and relying on builtin fish functionality rather
#     than re-inventing it
#   - or maybe just use a more generic shell-agnostic package manager like
#     https://ellipsis.sh/ or https://github.com/pearl-core/pearl

#if test ! -f ~/.config/fish/functions/fisher.fish
#  curl -fL --create-dirs \
#    -o ~/.config/fish/functions/fisher.fish https://git.io/fisher
#end

# for some reason when this runs during `docker build` just plain
# `fisher` command doesn't find the fishfile
#fisher add < ~/.config/fish/fishfile
