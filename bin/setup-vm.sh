#!/usr/bin/env bash

set -e

: ${HOST}
: ${USERNAME}
: ${PASSWORD}

apt-get install -y sshpass

shpass -p ${PASSWORD} scp -r $PWD/azure-linux-auto ${USERNAME}@${HOST}:/tmp
shpass -p ${PASSWORD} ssh  ${USERNAME}@${HOST} ls -al
