ARG NODE_VERSION=18.16.0-bullseye
FROM --platform=$TARGETPLATFORM node:${NODE_VERSION}-slim

FROM debian:stable

RUN apt-get update \
	&& apt-get install -yqq --no-install-recommends python3 python3-pip pipx jq

RUN python3 -m venv /env \
    && . /env/bin/activate \
    && pip install yq

ADD generate-config.sh config.jq docker_example.yml /
RUN chmod a+x /generate-config.sh

ENTRYPOINT /generate-config.sh