FROM alpine:3.5

ENV NODDES_VERSION 0.0.18

ENV PATH $PATH:/opt/node-v${NODEJS_VERSION}-linux-x64/bin

RUN apk add --no-cache \
            git \
            ca-certificates \
            nodejs && \
    mkdir -p /opt/npm/ && \
    npm install -g node-deploy-essentials@${NODDES_VERSION} && \
    addgroup -g 10777 nodeworker && \
    adduser -D -G nodeworker -u 10777 nodeworker && \
    chown -R nodeworker:nodeworker /opt/

#
# WORKDIR
#
USER nodeworker
VOLUME ["/opt/npm/"]
WORKDIR /opt/npm/
CMD ["ndes", "--version"]
