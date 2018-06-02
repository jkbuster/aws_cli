FROM alpine:latest

LABEL maintainer="jason@jkbuster.com"

RUN apk --no-cache add \
  python3 \
  groff \
  less && \
  pip3 install awscli==1.15.31 && \
  apk --purge --no-cache del py-pip && \
  rm -rf /root/.cache

VOLUME /root/.aws
VOLUME /project
WORKDIR /project

ENTRYPOINT ["aws"]
CMD ["help"]
