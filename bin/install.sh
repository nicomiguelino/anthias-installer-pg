#!/bin/bash -e

FILENAME=$(basename $0)
DIRNAME=$(readlink -f $(dirname $0))

echo "[$FILENAME] Hello, Venus!"

$DIRNAME/upgrade_containers.sh
