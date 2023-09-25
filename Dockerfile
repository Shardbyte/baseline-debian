FROM debian:bookworm

LABEL maintainer="Shardbyte <saint@shardbyte.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV USER_UID 1000
ENV USER_NAME byte
ENV USER_HOME /home/byte

RUN apt update \
      && apt upgrade -y \
      && sudo apt dist-upgrade -y \
      && sudo apt autoremove -y \
      && sudo apt autoclean -y \
      && sudo apt clean -y \
      && useradd -ms /bin/bash -u $USER_UID $USER_NAME \
      && rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
