#!/usr/bin/env bash

set -e

: ${HOST}
: ${USERNAME}
: ${PASSWORD}

apt-get install -y sshpass

echo "Coping azure-linux-auto to ${HOST}..."
sshpass -p ${PASSWORD} scp -o StrictHostKeyChecking=no -r $PWD/azure-linux-auto ${USERNAME}@${HOST}:/tmp
echo "Verifying azure-linux-auto now exists on ${HOST}..."
sshpass -p ${PASSWORD} ssh -o StrictHostKeyChecking=no ${USERNAME}@${HOST} ls -al /tmp/azure-linux-auto
echo "Removing azure-linux-auto on ${HOST}..."
sshpass -p ${PASSWORD} ssh -o StrictHostKeyChecking=no ${USERNAME}@${HOST} rm -rf /tmp/azure-linux-auto
echo "Verifying azure-linux-auto no longer exists on ${HOST}..."
sshpass -p ${PASSWORD} ssh -o StrictHostKeyChecking=no ${USERNAME}@${HOST} ls -al /tmp
