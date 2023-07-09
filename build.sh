#!/bin/bash

set -euxo pipefail

docker build -t registry.digitalocean.com/nadena-dev-sgp1/misskey-config:latest misskey-configgen
#docker build -t registry.digitalocean.com/nadena-dev-sgp1/misskey:latest misskey


docker push registry.digitalocean.com/nadena-dev-sgp1/misskey-config:latest
#docker push registry.digitalocean.com/nadena-dev-sgp1/misskey:latest

