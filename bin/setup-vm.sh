#!/usr/bin/env bash

set -e

: ${HOST}
: ${USERNAME}
: ${PASSWORD}

apt-get install -y sshpass

sshpass -p ${PASSWORD} scp -r $PWD/azure-linux-auto ${USERNAME}@${HOST}:/tmp
sshpass -p ${PASSWORD} ssh  ${USERNAME}@${HOST} ls -al
