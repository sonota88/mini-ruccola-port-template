FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ruby \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ARG user
ARG group

RUN groupadd ${user} \
  && useradd ${user} -g ${group} -m

USER ${user}

WORKDIR /home/${user}/work

ENV IN_CONTAINER=1
