FROM hiroara/myenv:plain

# Build deps
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      software-properties-common \
      && \
    rm -rf /var/lib/apt/lists/*

# Ruby
RUN apt-add-repository -y ppa:rael-gc/rvm && \
    apt-get update && \
    apt-get install -y rvm && \
    rm -rf /var/lib/apt/lists/*
