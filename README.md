# Docker Image for running Garufa websocket server (https://github.com/Juanmcuello/garufa)

![tzenderman/docker-garufa](http://dockeri.co/image/tzenderman/docker-garufa)

Quick Start
===========

## Install Docker

https://docs.docker.com/installation/#installation

## Launch your container:

    $ docker pull tzenderman/docker-garufa:latest
    $ docker run --name garufa -ti -p 80:80 -d tzenderman/docker-garufa:latest

By default, Nginx will be running on `127.0.0.1:80` and the Garufa variables will be:

    GARUFA_APP_ID = 1
    GARUFA_APP_KEY = abc12345678
    GARUFA_SECRET = 12345678abc

## Customize Garufa

    $ docker run --name garufa -d \
        -e 'GARUFA_APP_ID=123' -e 'GARUFA_APP_KEY=somekey' -e 'GARUFA_SECRET=somethingsecret' \
        tzenderman/docker-garufa:latest

## Shell Access

    $ docker exec -it garufa /bin/bash -l

## Links:

Garufa: https://github.com/Juanmcuello/garufa

Pusher: https://pusher.com/
