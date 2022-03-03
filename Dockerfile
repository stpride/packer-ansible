FROM alpine:3.15

ARG PACKER_VER=1.7.10
ENV USER ansible

RUN apk --no-cache add unzip bash git ca-certificates openssh-client sed openssl ansible \
  && wget -O /tmp/packer.zip \
    "https://releases.hashicorp.com/packer/${PACKER_VER}/packer_${PACKER_VER}_linux_amd64.zip" \
  && unzip -o /tmp/packer.zip -d /usr/local/bin \
  && rm -f /tmp/packer.zip \
  && apk --no-network del openssl
