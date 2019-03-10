
FROM ohmyfish/fish:3.0.0
MAINTAINER jitakirin <jitakirin@gmail.com>

USER root

# bash - for YADM
# python3 - for grc
# less and tree - just for convenience
RUN \
  apk add -U bash less python3 tree \
  && rm -rf /var/cache/apk/*

# generic colouriser (debian and opensuse have a package for it, alpine
# does not (yet))
RUN \
  cd /tmp \
  && git clone https://github.com/garabik/grc.git \
  && cd grc \
  && sudo ./install.sh \
  && cd /tmp \
  && rm -rf grc

# yet another dotfile manager (no package for alpine yet)
RUN \
  curl -fLo /usr/local/bin/yadm \
    https://github.com/TheLocehiliosan/yadm/raw/master/yadm \
  && chmod a+x /usr/local/bin/yadm

COPY . /src

RUN \
  install -o root -g root -m 644 \
    /src/.dotfiles-waffles/syssetup/user-bin-dir.sh \
    /etc/profile.d/ \
  && install -o root -g root -m 644 \
    /src/.dotfiles-waffles/syssetup/user-bin-dir.fish \
    /usr/local/etc/fish/conf.d/

USER nemo

RUN yadm clone --bootstrap /src
