FROM lsiobase/ubuntu:focal
LABEL maintainer="RandomNinjaAtk"

ENV TITLE="Automated Movie Trailer Downloader (AMTD)"
ENV VERSION="1.0.4"

RUN \
	echo "************ install dependencies ************" && \
	echo "************ install & upgrade packages ************" && \
	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
		curl \
		jq \
		python3 \
		python3-pip \
		ffmpeg \
		mkvtoolnix && \
	rm -rf \
		/tmp/* \
		/var/lib/apt/lists/* \
		/var/tmp/* && \
	echo "************ install python packages ************" && \
	pip3 install --no-cache-dir -U \
		mutagen \
		youtube_dl

# copy local files
COPY root/ /

# set work directory
WORKDIR /config

# ports and volumes
VOLUME /config
