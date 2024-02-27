FROM debian:bullseye

# get packages
RUN apt-get update; \
    apt-get -y install \
    bison \
    build-essential \
    clang-9 \
    curl \
    flex \
    ghc \
    libedit-dev \
    libgmp-dev \
    libz-dev \
    llvm-9 \
    libnuma-dev \
    locales

# Set the locale (hopefully)
# source: http://jaredmarkell.com/docker-and-locales/
RUN locale-gen en_GB.UTF-8
ENV LC_ALL en_GB.UTF-8  

# get stack (for haskell)
RUN curl -sSL https://get.haskellstack.org/ | sh

# do something to the path so it just works(TM)
RUN export PATH=${HOME}/.local/bin:${PATH}

# get haskell things from stack
RUN stack --resolver lts-18.28 --install-ghc install BNFC alex happy
