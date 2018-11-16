FROM        quayio/coreos-etcd

VOLUME      /data
EXPOSE      2379 2380 4001 7001
ENV HOSNAME
LABEL maintainer="Matt Kimberley <matthew.kimberley@fasthosts.com>" \
    version="0.31"

CMD         /usr/local/bin/etcd -advertise-client-urls http://0.0.0.0:2379 \ 
                                -listen-client-urls http://0.0.0.0:2379 \
                                -discovery https://discovery.etcd.io/d27642a5f9ec3b27d5508c61781f87cd \
                                -listen-peer-urls http://0.0.0.0:2380
                                #-initial-advertise-peer-urls http://${HostIP}:2380 \
                                #-listen-peer-urls http://0.0.0.0:2380 \
                                #-initial-cluster-token etcd-cluster-1 \
                                #-initial-cluster etcd0=http://${HostIP}:2380 \
                                #-initial-cluster-state new