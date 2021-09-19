# django-container-sample

## Overview
A Django container application using Nginx as the web server (reverse proxy) and uwsgi as the application server.
- client <-> Nginx <-> uwsgi <-> Django

## Description

### Source
- `/opt/src/django_container_sample`

### Configuration
- Nginx
  - `/etc/nginx/nginx.conf`
- uwsgi
  - `/opt/src/uwsgi/uwsgi.ini`

### Log
- Nginx
  - `/var/log/nginx/access.log`
  - `/var/log/nginx/error.log`
- uwsgi
  - `/var/log/uwsgi/uwsgi.log`

## How to use

- Run the image build in the directory where the `dockerfile` is located.
  - `docker build . -t django-container-sample`
- Start the container. 
- Nginx listens on port 80, so map any port to port 80.
  - `docker run -itd -p 8090:80 --rm --name django-container-sample django-container-sample`
- Check the response.
  - http://localhost:8090/hello?format=json
  - Assumed result : `{"message":"Hello, world!"}`
