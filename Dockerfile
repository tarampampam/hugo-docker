FROM golang:1.16-alpine AS builder

# must be passed without any prefix, just clean version number (like `1.2.3` or `4.5`)
# e.g.: `docker build --build-arg "HUGO_VERSION=0.49.1" .`
ARG HUGO_VERSION

ENV \
    CGO_ENABLED="1" \
    GOOS="linux" \
    GO111MODULE="on"

# gcc/g++ are required to build SASS libraries for extended version
RUN set -x \
    && apk update \
    && apk add --no-cache git gcc g++ musl-dev \
    && go version \
    && go get github.com/magefile/mage \
    && git clone --branch "v${HUGO_VERSION}" --depth 1 --single-branch https://github.com/gohugoio/hugo /tmp/hugo

WORKDIR /tmp/hugo

RUN set -x \
    && mage hugo \
    && mage install

FROM alpine:latest

ARG HUGO_VERSION
ARG BUILD_DATE

LABEL \
    org.label-schema.schema-version="1.0" \
    org.label-schema.name="hugo" \
    org.label-schema.description="The world's fastest framework for building static websites" \
    org.label-schema.version="${HUGO_VERSION}" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.vendor="hugo" \
    org.label-schema.url="https://gohugo.io" \
    org.label-schema.vcs-url="https://github.com/gohugoio/hugo"

COPY --from=builder /go/bin/hugo /usr/bin/hugo

# libc6-compat & libstdc++ are required for extended SASS libraries
# ca-certificates are required to fetch outside resources (like Twitter oEmbeds)
# git is required for `enableGitInfo` option
RUN set -x \
    && apk update \
    && apk add --no-cache ca-certificates libc6-compat libstdc++ git \
    && rm -rf /var/cache/apk/* \
    && mkdir /src \
    && hugo version

# Expose port for live server
EXPOSE 1313

WORKDIR /src
VOLUME /src
ENTRYPOINT ["/usr/bin/hugo"]
CMD ["--help"]
