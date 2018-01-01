
FROM ohmyfish/fish
MAINTAINER jitakirin <jitakirin@gmail.com>

USER root

# pip - needed to install vex
# python-dev and gcc - for pip (to compile packages containing extensions)
# python3 - for grc
# less and tree - just for convenience
RUN \
  apk add -U gcc less python-dev py2-pip python3 tree && rm -rf /var/cache/apk/*

# generic colouriser (debian and opensuse have a package for it, alpine
# does not (yet))
RUN \
  cd /tmp \
  && git clone https://github.com/garabik/grc.git \
  && cd grc \
  && sudo ./install.sh \
  && cd /tmp \
  && rm -rf grc

COPY syssetup/user-bin-dir.sh /etc/profile.d/
COPY syssetup/user-bin-dir.fish /usr/local/etc/fish/conf.d/

# COPY creates the files as root, reset ownership to the user
# e.g. fisher complains if it cannot update fishfile
COPY vex/.vexrc /home/nemo/.vexrc
COPY fish/.config/fish/fishfile /home/nemo/.config/fish/
RUN chown -R nemo:"$(id -gn nemo)" /home/nemo/.config /home/nemo/.vexrc

USER nemo

RUN mkdir -p ~/.local/venvs && pip install --user vex

RUN curl \
  -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

RUN fish -c 'fisher < /home/nemo/.config/fish/fishfile'
