FROM golang:1.13-alpine as builder
RUN apk update && apk upgrade && apk add --no-cache bash git make gcc musl-dev
WORKDIR /go/src/github.com/malike/manifest/
COPY . .
RUN make build-service

FROM alpine
COPY --from=builder /go/src/github.com/malike/manifest/service/manifestservice ./
COPY --from=builder /go/src/github.com/malike/manifest/service/.env ./
ENV API_PORT=9090
EXPOSE 9090
ENTRYPOINT ["./manifestservice"]