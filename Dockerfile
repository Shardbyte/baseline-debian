FROM debian:bookworm

LABEL maintainer="Shardbyte <saint@shardbyte.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV USER_UID 1000
ENV USER_NAME byte
ENV USER_HOME /home/byte

RUN apt update \
      && apt-get upgrade -y \
      && apt-get dist-upgrade -y \
      && apt-get autoremove -y \
      && apt-get autoclean -y \
      && apt-get clean -y \
      && useradd -ms /bin/bash -u $USER_UID $USER_NAME \
      && rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
