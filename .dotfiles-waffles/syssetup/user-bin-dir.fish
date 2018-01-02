if test "$HOME" != "/" -a -d "$HOME/.local/bin"; and \
    not contains "$HOME/.local/bin" $PATH
  set -gx PATH $HOME/.local/bin $PATH
end
