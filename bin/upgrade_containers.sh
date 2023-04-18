#!/bin/bash -e

sudo -E docker compose build
sudo -E docker image prune -f
sudo -E docker compose up -d
