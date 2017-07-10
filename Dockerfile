
FROM ohmyfish/fish
MAINTAINER jitakirin <jitakirin@gmail.com>

USER root

RUN apk add -U less python3 tree && rm -rf /var/cache/apk/*

RUN \
  cd /tmp \
  && git clone https://github.com/garabik/grc.git \
  && cd grc \
  && sudo ./install.sh \
  && cd /tmp \
  && rm -rf grc

# COPY creates the file as root, fisher complains that it cannot update it
COPY fish/.config/fish/fishfile /home/nemo/.config/fish/
RUN chown -R nemo:"$(id -gn nemo)" /home/nemo/.config

USER nemo

RUN curl \
  -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

RUN fish -c 'fisher < /home/nemo/.config/fish/fishfile'
