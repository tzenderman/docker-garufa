# Docker Image for Garufa Websocket Server
See: https://github.com/Juanmcuello/garufa

[![tzenderman/docker-garufa](http://dockeri.co/image/tzenderman/docker-garufa)](https://registry.hub.docker.com/u/tzenderman/docker-garufa/)

Quick Start
===========

## Install Docker

https://docs.docker.com/installation/#installation

## Launch your container:

    $ docker pull tzenderman/docker-garufa:latest
    $ docker run --name garufa -ti -p 80:80 tzenderman/docker-garufa:latest

By default, Nginx will be running on `127.0.0.1:80` and the Garufa variables will be:

    GARUFA_APP_ID = 1
    GARUFA_APP_KEY = abc12345678
    GARUFA_SECRET = 12345678abc

## Customize Garufa

    $ docker run --name garufa \
        -e 'GARUFA_APP_ID=123' \
        -e 'GARUFA_APP_KEY=somekey' \
        -e 'GARUFA_SECRET=somethingsecret' \
        -e 'GARUFA_PORT=8080' \
        tzenderman/docker-garufa:latest

## Customize Nginx

    $ docker run --name garufa \
        -v <host-sites-enabled-dir>:/etc/nginx/sites-enabled \
        -v <host-ssl-dir>:/etc/nginx/ssl \
        tzenderman/docker-garufa:latest

## Shell Access

    $ docker exec -it garufa /bin/bash -l

## Links:

Garufa: https://github.com/Juanmcuello/garufa

Pusher: https://pusher.com/
