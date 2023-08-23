FROM debian

RUN apk add --no-cache \
  bash \
  curl

EXPOSE 80000
