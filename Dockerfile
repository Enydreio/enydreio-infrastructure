FROM alpine:latest
WORKDIR /root/

RUN apk add --no-cache wget tar
COPY init-options.json .
CMD wget -O app https://github.com/Enydreio/enydreio-backend/releases/download/main/enydreio-backend && wget https://github.com/Enydreio/enydreio-frontend/releases/download/main/dist.tar.gz && tar -xzf dist.tar.gz && rm dist.tar.gz && chmod +x app