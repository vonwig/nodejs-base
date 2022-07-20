FROM alpine:3.14@sha256:43eb8f0d8215d8661f745f3d88563c026614d843b668b233bbe1666b6d026f61

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
