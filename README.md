## Nginx Dockerfile


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/yangqi/docker-nginx/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [yangqi/docker-debian](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/yangqi/docker-nginx/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull yangqi/docker-nginx`

   (alternatively, you can build an image from Dockerfile: `docker build -t="yangqi/docker-nginx" github.com/yangqi/docker-nginx`)


### Usage

    docker run -d -p 80:80 yangqi/docker-nginx

#### Attach persistent/shared directories

    docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/conf.d -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx -v <html-dir>:/var/www/html yangqi/nginx

After few seconds, open `http://<host>` to see the welcome page.
