FROM node:22-alpine AS build-vue
WORKDIR /app

RUN apk add --no-cache git
RUN git clone https://github.com/enydreio/enydreio-frontend.git .

RUN npm install
RUN npm run build

FROM golang:1.23-alpine AS build-go
WORKDIR /go-server
RUN apk add --no-cache git
RUN git clone https://github.com/enydreio/enydreio-backend.git .

RUN go build -o /go-server/app

FROM alpine:latest
WORKDIR /root/

COPY --from=build-vue /app/dist /dist

COPY --from=build-go /go-server/app .

EXPOSE 8080

COPY .env .env
RUN source .env
RUN rm .env
CMD POSTGRES_DB=$POSTGRES_DB POSTGRES_USER=$POSTGRES_USER POSTGRES_PASSWORD=$POSTGRES_PASSWORD ./app
