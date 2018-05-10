FROM golang:1.8-alpine as builder

RUN apk add --no-cache git \
    && go get -d github.com/optiopay/klar \
    && go build ./src/github.com/optiopay/klar

FROM alpine:3.7

RUN apk add --no-cache ca-certificates
COPY --from=builder /go/klar /klar

ENTRYPOINT ["/klar"]
