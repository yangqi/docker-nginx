#
# Nginx Dockerfile
#
# https://github.com/yangqi/nginx
#

# Pull base image.
FROM yangqi/docker-debian
MAINTAINER Qi Yang <i@yangqi.me>

ENV DEBIAN_FRONTEND noninteractive

# Install Nginx.
RUN \
  apt-get update && \
  apt-get install -y wget && \
  echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list.d/nginx.list && \
  echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list.d/nginx.list && \
  wget -q http://nginx.org/keys/nginx_signing.key && \
  apt-key add nginx_signing.key && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /usr/share/nginx

ADD nginx.conf /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
