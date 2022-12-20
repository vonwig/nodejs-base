FROM alpine:3.14@sha256:eb3e4e175ba6d212ba1d6e04fc0782916c08e1c9d7b45892e9796141b1d379ae

# Install nodejs and friends
RUN apk add --no-cache \
  nodejs=14.20.1-r0

# ENV VARs needed for Node.js
ENV BLUEBIRD_WARNINGS=0 \
  NODE_ENV=production \
  NODE_NO_WARNINGS=1 \
  NPM_CONFIG_LOGLEVEL=warn \
  SUPPRESS_NO_CONFIG_WARNING=true

WORKDIR /app

# atomist-start: fix for https://dso.docker.com/AQ1K5FIKA/overview/cve/ATM-2022-0001
RUN apk add --no-cache \
  busybox=1.33.1-r8
# atomist-end
