FROM debian:jessie

MAINTAINER ieee0824 

RUN set -eu && \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		build-essential \
		ca-certificates \
		curl \
		wget \
		git \
		libssl-dev \
		libncurses5-dev \
		liblua5.1-dev \
		luajit \
		libluajit-5.1-dev

# build vim
RUN set -eu && \
	mkdir -p /tmp/vim-build && \
	cd /tmp/vim-build && \ 
	wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2 && \
	tar xvf vim-7.4.tar.bz2 && \
	cd vim74 && \
	./configure --with-features=huge \
               --enable-multibyte \
               --enable-luainterp \
               --with-luajit \
               --with-fontset \
               --enable-fail-if-missing && \
	make && \
	make install && \
	vim --version

RUN set -eu && \
	rm -rf /tmp/vim-build && \
	vim --version

# install Go
RUN set -eu && \
	git clone https://github.com/wfarr/goenv.git /root/.goenv && \
	echo 'eval "$(goenv init -)"' >> $HOME/.bashrc

ENV PATH /root/.goenv/bin:$PATH

RUN mkdir -p /root/go
ENV GOPATH /root/go
ENV PATH /root/go/bin:$PATH

WORKDIR /root
