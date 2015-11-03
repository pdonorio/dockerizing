#!/bin/bash

/etc/init.d/nginx start
uwsgi --ini /etc/uwsgi/vassals/uwsgi.ini
