FROM centos

RUN yum update -y
RUN yum install numactl libaio xfsprogs e2fsprogs -y

ADD rexray /usr/bin/rexray

RUN mkdir -p /bin/emc /opt/emc /run/docker/plugins /var/lib/libstorage/volumes

ENTRYPOINT ["rexray"]
