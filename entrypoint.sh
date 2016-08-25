#! /bin/sh
# script to provision htpasswd through docker entrypoint

set -e

user=$HT_USER
password=$HT_PASSWORD

[ -z $user ] || [ -z $password ] && echo "User or password not supplied through environment variables!" && exit 1

mkdir -p /auth/
htpasswd -Bbn "$user" "$password" > /auth/htpasswd

# normal registry:2 entrypoint
registry serve /etc/docker/registry/config.yml
