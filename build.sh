#!/bin/bash

set -ex
DOCKER_REPO="cduchesne"
DRIVER="$1"
RR_VERSION="0.7.0"
TMPDIR=$(mktemp -d tmp.${DRIVER}.XXXX)
if [[ $DRIVER == *"agent"* ]]; then
	RR_BINARY="rexray-agent"
else
	RR_BINARY="rexray"
fi
		


if [ ! -f ./${RR_BINARY}-Linux-x86_64-${RR_VERSION}.tar.gz ]; then
	curl -OL https://dl.bintray.com/emccode/rexray/stable/${RR_VERSION}/${RR_BINARY}-Linux-x86_64-${RR_VERSION}.tar.gz
fi

tar xf ${RR_BINARY}-Linux-x86_64-${RR_VERSION}.tar.gz -C ./${DRIVER}

docker build -t rexray-${DRIVER} ${DRIVER}

docker create --name rexray-${DRIVER} rexray-${DRIVER}

mkdir -p $TMPDIR/rootfs

docker export -o $TMPDIR/rexray.tar rexray-${DRIVER}

docker rm -vf rexray-${DRIVER}

( cd $TMPDIR/rootfs && tar xf ../rexray.tar )

cp ${DRIVER}/config.json $TMPDIR

docker plugin create "${DOCKER_REPO}/rexray-${DRIVER}" "$TMPDIR"

rm -rf $TMPDIR

rm -rf ${DRIVER}/${RR_BINARY}
