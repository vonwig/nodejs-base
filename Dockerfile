FROM alpine:3.14@sha256:06b5d462c92fc39303e6363c65e074559f8d6b1363250027ed5053557e3398c5

# Install nodejs and friends
RUN apk add --no-cache \
  nodejs=14.19.0-r0

# ENV VARs needed for Node.js
ENV BLUEBIRD_WARNINGS=0 \
  NODE_ENV=production \
  NODE_NO_WARNINGS=1 \
  NPM_CONFIG_LOGLEVEL=warn \
  SUPPRESS_NO_CONFIG_WARNING=true

WORKDIR /app

# atomist-start: fix for https://dso.atomist.com/AQ1K5FIKA/overview/cve/ATM-2022-0001
RUN apk add --no-cache \
  busybox=1.33.1-r7
# atomist-end
