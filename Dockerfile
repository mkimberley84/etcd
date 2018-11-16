FROM        quayio/coreos-etcd

VOLUME      /data
EXPOSE      2379 2380 4001 7001

LABEL maintainer="Matt Kimberley <matthew.kimberley@fasthosts.com>" \
    version="0.31"

CMD         /usr/local/bin/etcd -advertise-client-urls http://0.0.0.0:2379 \ 
                                -listen-client-urls http://0.0.0.0:2379 \
                                -discovery https://discovery.etcd.io/8bd87c9f576ed4f6ccc1b22aa91e7fb4 \
                                -listen-peer-urls http://0.0.0.0:2380
                                #-initial-advertise-peer-urls http://${HostIP}:2380 \
                                #-listen-peer-urls http://0.0.0.0:2380 \
                                #-initial-cluster-token etcd-cluster-1 \
                                #-initial-cluster etcd0=http://${HostIP}:2380 \
                                #-initial-cluster-state new