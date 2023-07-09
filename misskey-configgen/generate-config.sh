#!/bin/bash -x

set -euxo pipefail

env | grep -v PASSWORD

mkdir -p /config
/env/bin/yq '.url = env.MISSKEY_URL |
.db.host = env.POSTGRES_HOST |
.db.port = env.POSTGRES_PORT |
.db.db = env.POSTGRES_DB |
.db.user = env.POSTGRES_USER |
.db.pass = env.POSTGRES_PASSWORD |
.db.extra = {"ssl": true, "statement_timeout":null}' < /docker_example.yml > /config/default.yml
ls -l /config
ls -lh /root -a