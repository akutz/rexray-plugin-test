FROM centos

RUN yum update -y
RUN yum install e2fsprogs nfs-utils xfsprogs -y

ADD rexray-agent /usr/bin/rexray-agent

RUN mkdir -p /run/docker/plugins /var/lib/libstorage/volumes

ENTRYPOINT ["rexray-agent"]
