FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update

RUN apt update \
  && apt install -y --no-install-recommends \
    ruby \
    gforth \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ARG USER
ARG GROUP

RUN groupadd ${USER} \
  && useradd ${USER} -g ${GROUP} -m

USER ${USER}

WORKDIR /home/${USER}/work

ENV IN_CONTAINER=1
