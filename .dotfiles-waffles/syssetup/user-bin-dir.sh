if test "${HOME}" != "/" -a -d "${HOME}/.local/bin"; then
  PATH="${HOME}/.local/bin:${PATH}"
fi
