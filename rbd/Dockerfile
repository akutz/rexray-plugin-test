FROM centos

RUN yum install epel-release -y

ADD ceph.repo /etc/yum.repos.d/ceph.repo

RUN yum update -y

RUN yum --enablerepo=epel install ceph-common -y

RUN yum install iproute xfsprogs e2fsprogs -y

ADD rexray /usr/bin/rexray

RUN mkdir -p /etc/ceph /opt/emc /bin/emc /var/lib/libstorage/volumes /run/docker/plugins

RUN rm -rf /usr/sbin/modprobe && ln -s /usr/bin/echo /usr/sbin/modprobe

ENTRYPOINT ["rexray"]

