#!/bin/bash

/usr/sbin/nginx
uwsgi /opt/src/uwsgi/uwsgi.ini

tail -f /dev/null