#! /bin/sh
# script to provision htpasswd through docker entrypoint

set -e

if [ $# -ne 2 ]; then
  echo "Usage: <user> <password>"
  exit 1
fi

user=$1
password=$2

mkdir -p /auth/
htpasswd -Bbn "$user" "$password" > /auth/htpasswd

# normal registry:2 entrypoint
registry serve /etc/docker/registry/config.yml
