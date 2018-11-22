FROM ubuntu:16.04

ENV DOCKER_VERSION 17.03.3~ce-0~ubuntu-xenial

RUN set -xe \
    && export DEBIAN_FRONTEND=noninteractive \
		&& sed -i -e 's/archive.ubuntu.com/mirror.yandex.ru/' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -qq \
			apt-transport-https \
    	ca-certificates \
    	curl \
    	software-properties-common \
      cmake \
      pkg-config \
      libssh2-1-dev \
      libssl-dev \
      git \
      ruby-full

RUN set -xe \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
		&& add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN set -xe \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
		&& apt-get install -qq \
			docker-ce=$DOCKER_VERSION

RUN set -xe \
		&& gem install dapp \
		&& mkdir -p /src

WORKDIR /src
