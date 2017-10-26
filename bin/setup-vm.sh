#!/usr/bin/env bash

set -e

: ${HOST}
: ${USERNAME}
: ${PASSWORD}

apt-get install -y sshpass

sshpass -p ${PASSWORD} scp -o StrictHostKeyChecking=no -r $PWD/azure-linux-auto ${USERNAME}@${HOST}:/tmp
sshpass -p ${PASSWORD} ssh -o StrictHostKeyChecking=no ${USERNAME}@${HOST} ls -al
