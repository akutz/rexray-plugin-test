FROM centos

RUN yum update -y
RUN yum install xfsprogs e2fsprogs -y

ADD rexray-agent /usr/bin/rexray-agent

RUN mkdir -p /run/docker/plugins /var/lib/libstorage/volumes

ENTRYPOINT ["rexray-agent"]
