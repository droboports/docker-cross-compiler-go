FROM droboports/compiler

MAINTAINER ricardo@droboports.com

ENV GOLANG_VERSION 1.5.1
ENV GOARCH arm
ENV GOARM 7

RUN set -x; \
    wget -O /tmp/xgolang.tgz https://github.com/droboports/golang/releases/download/v${GOLANG_VERSION}/xgolang.tgz && \
    mkdir -p /home/drobo/xtools/golang/5n && \
    tar -zxf /tmp/xgolang.tgz -C /home/drobo/xtools/golang/5n && \
    rm -f /tmp/xgolang.tgz && \
    chown -R drobo:drobo /home/drobo

COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME ["/home/drobo/build", "/mnt/DroboFS/Shares/DroboApps", "/dist"]

ENV PATH /home/drobo/xtools/golang/5n/bin:${PATH}

USER drobo

ENTRYPOINT ["/docker-entrypoint.sh"]
