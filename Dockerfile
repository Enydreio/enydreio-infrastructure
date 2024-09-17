FROM node:18-alpine AS build-vue
WORKDIR /app

RUN apk add --no-cache git
RUN git clone https://github.com/enydreio/enydreio-frontend.git .

RUN npm install
RUN npm run build

FROM golang:1.20-alpine AS build-go
WORKDIR /go-server

RUN apk add --no-cache git
RUN git clone https://github.com/enydreio/enydreio-backend.git .

RUN go build -o /go-server/app

FROM alpine:latest
WORKDIR /root/

COPY --from=build-vue /app/dist /webapp

COPY --from=build-go /go-server/app .

EXPOSE 8080

CMD ["./app"]

