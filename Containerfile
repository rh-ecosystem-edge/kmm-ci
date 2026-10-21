FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

LABEL maintainer="rh-ecosystem-edge"

RUN microdnf install -y bash coreutils jq procps-ng && \
    microdnf clean all

COPY Makefile /app/Makefile
COPY ci/ /app/ci/

WORKDIR /app

