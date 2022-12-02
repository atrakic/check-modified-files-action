FROM alpine:3.10
RUN apk add --no-cache bash git
WORKDIR /
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
