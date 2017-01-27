FROM centos

RUN yum update -y
RUN yum install xfsprogs e2fsprogs -y

RUN mkdir -p /etc/rexray /run/docker/plugins /var/lib/libstorage/volumes
ADD rexray /usr/bin/rexray
ADD rexray.yml /etc/rexray/rexray.yml

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh", "rexray", "start", "-f" ]
