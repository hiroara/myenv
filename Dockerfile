FROM ubuntu:20.04

LABEL maintainer="Hiroki Arai <hiroara62@gmail.com>"

# Tools
RUN apt-get update && \
    apt-get install -y \
      curl \
      git-core \
      tmux \
      vim \
      wget \
      && \
    rm -rf /var/lib/apt/lists/*

# Build deps
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      build-essential \
      libbz2-dev \
      libffi-dev \
      liblzma-dev \
      libncurses5-dev \
      libreadline-dev \
      libsqlite3-dev \
      libssl-dev \
      libxml2-dev \
      libxmlsec1-dev \
      llvm \
      make \
      tk-dev \
      xz-utils \
      zlib1g-dev \
      && \
    rm -rf /var/lib/apt/lists/*

# Python
RUN curl https://pyenv.run | bash && \
    echo 'export PATH="/root/.pyenv/bin:$PATH"' >> $HOME/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> $HOME/.bashrc && \
    echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.bashrc
ENV PYTHON_VERSION=3.9.0
RUN $HOME/.pyenv/bin/pyenv install $PYTHON_VERSION && \
    pyenv global $PYTHON_VERSION

COPY ./conf/tmux.conf /root/.tmux.conf

RUN mkdir /work
WORKDIR /work

CMD ["/bin/bash"]
