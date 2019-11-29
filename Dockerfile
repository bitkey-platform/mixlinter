FROM golang:1.12 as builder

ARG VCS_REF
ARG BUILD_DATE
LABEL maintainer="Bitkey Inc." \
      org.label-schema.url="https://bitkey.co.jp" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/bitkey-platform/mixlinter"\
      org.label-schema.vcs-ref=$VCS_REF

WORKDIR /go/src/github.com/bitkey-platform/mixlinter
COPY . .
RUN go get -u golang.org/x/tools/go/analysis
RUN CGO_ENABLED=0 go build -i -o /mixlinter -ldflags "-s -w" ./cmd/mixlinter

FROM golang:1.12-alpine

RUN apk add build-base
COPY --from=builder /mixlinter /

ENTRYPOINT ["/mixlinter"]
