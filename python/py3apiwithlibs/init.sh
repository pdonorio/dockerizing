#!/bin/bash

LOGS=""
echo "Internal production startup"
echo ""

####################################
if [ -n "$UWSGI_MASTER" ]; then
    echo "Starting uwsgi"
    uwsgi --ini $UWSGI_MASTER
    echo ""
    LOGS="/var/log/uwsgi/*log $LOGS"
elif [ -n "$UWSGI_EMPEROR" ]; then
    echo "Starting uwsgi in emperor/vassals mode"
    uwsgi --emperor $UWSGI_EMPEROR
    echo ""
fi

####################################
if [ -n "$NGINX_ACTIVE" ]; then
    # remove defaults
    rm -rf /etc/nginx/sites-enabled
    echo "Starting nginx"
    service nginx start
    echo ""
    LOGS="/var/log/nginx/*log $LOGS"
fi

####################################
if [ "$LOGS" != "" ]; then
    sleep 2
    echo "Waiting for logs:"
    tail -f $LOGS
    echo "There was a problem. Hanging."
fi

####################################
sleep infinity
