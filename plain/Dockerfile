FROM ubuntu:20.04

LABEL maintainer="Hiroki Arai <hiroara62@gmail.com>"

# Tools
RUN apt-get update && \
    apt-get install -y \
      curl \
      git-core \
      language-pack-en \
      language-pack-ja \
      rsync \
      tmux \
      vim \
      wget \
      && \
    rm -rf /var/lib/apt/lists/*

RUN update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN mkdir -p -m 0700 /root/.ssh && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts

COPY ./conf/tmux.conf /root/.tmux.conf
COPY ./conf/ssh_config /root/.ssh/config
COPY ./scripts/init.sh /tmp/init.sh

RUN mkdir /work
WORKDIR /work

ENTRYPOINT ["/tmp/init.sh"]
CMD ["/bin/bash"]
