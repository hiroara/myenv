FROM ubuntu:20.04

LABEL maintainer="Hiroki Arai <hiroara62@gmail.com>"

# Tools
RUN apt-get update && \
    apt-get install -y \
      curl \
      git-core \
      rsync \
      tmux \
      vim \
      wget \
      && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/tmux.conf /root/.tmux.conf

RUN mkdir /work
WORKDIR /work

CMD ["/bin/bash"]
