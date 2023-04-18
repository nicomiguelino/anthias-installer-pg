#!/bin/bash -e

set -euox pipefail

FILENAME=$(basename $0)
DIRNAME=$(readlink -f $(dirname $0))
ANSIBLE_VERSION='ansible-core==2.12'
REPOSITORY='https://github.com/nicomiguelino/anthias-installer-pg.git'
BRANCH='main'

sudo apt update -y
sudo apt-get install -y --no-install-recommends \
    git \
    python3 \
    python3-dev \
    python3-pip

sudo pip install "$ANSIBLE_VERSION"

sudo -u ${USER} ansible localhost \
    -m git \
    -a "repo=$REPOSITORY dest=/home/${USER}/playground version=$BRANCH force=no"

cd /home/${USER}/playground

sudo -E -u ${USER} ansible-playbook install-docker.yml

$DIRNAME/upgrade_containers.sh
