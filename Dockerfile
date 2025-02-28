FROM alpine:latest
WORKDIR /root/

RUN apk add --no-cache wget tar
COPY init-options.json .
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]