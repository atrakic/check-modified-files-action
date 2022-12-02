FROM alpine:3.17.0
RUN apk add --no-cache bash git
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
