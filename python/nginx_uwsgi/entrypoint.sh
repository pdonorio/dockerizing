#!/bin/bash

/etc/init.d/nginx start
. /opt/venv/bin/activate
uwsgi --ini /etc/uwsgi/vassals/uwsgi.ini
