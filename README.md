# django-container-sample

## Overview
A Django container application using Nginx as the web server and uwsgi as the application server.

## How to use

* `docker build . -t django-container-sample`
* `docker run -itd -p 8090:80 --rm --name django-container-sample django-container-sample`
