FROM debian:jessie

MAINTAINER ieee0824 

RUN set -eu && \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		build-essential \
		ca-certificates \
		curl \
		git \
		libssl-dev
