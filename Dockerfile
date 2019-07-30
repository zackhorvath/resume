# XeTex Docker Image, Ubuntu 18.04 based with dependencies installed.
FROM ubuntu:18.04
MAINTAINER Zack Horvath, zack@horvathit.com

# Disable interactive prompts from Ubuntu packages.
ENV DEBIAN_FRONTEND=noninteractive

# Installs TeX, LaTeX, and XeLaTeX dependencies.
RUN apt update && apt install --yes \
  git \
  ca-certificates \
  wget \
  inotify-tools \
  lmodern \
  make \
  default-jre \
  texlive-fonts-recommended \
  texlive-generic-recommended \
  texlive-lang-english \
  texlive-xetex && \
  wget https://github.com/sylvainhalle/textidote/releases/download/v0.7.1/textidote_0.7.1_all.deb && \
  apt install ./textidote_0.7.1_all.deb &&\
  apt-get autoclean && \
  apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Export output data
WORKDIR /data
VOLUME ["/data"]
