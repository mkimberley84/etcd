FROM        quayio/coreos-etcd

VOLUME      /data
EXPOSE      2379 2380 4001 7001

LABEL maintainer="Matt Kimberley <matthew.kimberley@fasthosts.com>" \
    version="1.0"

CMD         /usr/local/bin/etcd -advertise-client-urls http://0.0.0.0:2379 -listen-client-urls http://0.0.0.0:2379