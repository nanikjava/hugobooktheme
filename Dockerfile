FROM debian:10-slim

ENV HUGO_VERSION='0.58.1'
ENV HUGO_NAME="hugo_extended_0.58.3_Linux-64bit"
ENV HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v0.58.3/hugo_extended_0.58.3_Linux-64bit.tar.gz"
ENV BUILD_DEPS="wget"
WORKDIR /hugo
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ${BUILD_DEPS} \
    git \
    ca-certificates && \
    wget "${HUGO_URL}" && \
    tar -zxvf "${HUGO_NAME}.tar.gz" && \
    mv ./hugo /usr/bin/hugo
WORKDIR /src

#to run the container make sure you are inside
#the directory that have your hugo files and 
#run the following command
#docker run  -i -t -v $(pwd):/src -p 1313:1313 hugo:extended

