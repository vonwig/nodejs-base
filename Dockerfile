FROM debian:stretch-slim@sha256:d87734c97bfd3681c64137af7754d03865c2d013eb05d42f81aa52a6516fc12b

# Install mongo server and clients
RUN apt-get update && apt-get install -y \
  mongodb=1:3.2.11-2+deb9u1 \
 && apt-get clean -y \
 && rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install nodejs and friends
RUN apt-get update && apt-get install -y \
  curl=7.52.1-5+deb9u16 \
 && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
 && apt-get update && apt-get install -y \
  nodejs=16.14.0-1nodesource1 \
 && apt-get remove -y curl \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ENV VARs needed for Node.js
ENV BLUEBIRD_WARNINGS=0 \
 NODE_ENV=production \
 NODE_NO_WARNINGS=1 \
 NPM_CONFIG_LOGLEVEL=warn \
 SUPPRESS_NO_CONFIG_WARNING=true

WORKDIR /app

# Set up labels to make image linking work
ARG COMMIT_SHA
ARG DOCKERFILE_PATH=Dockerfile

LABEL org.opencontainers.image.revision=$COMMIT_SHA \
  org.opencontainers.image.source=$DOCKERFILE_PATH