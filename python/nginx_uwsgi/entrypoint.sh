#!/bin/bash

/etc/init.d/nginx start
uwsgi --ini /etc/uwsgi/vassals/uwsgi.ini # --py-autoreload 1 --py-tracebacker
