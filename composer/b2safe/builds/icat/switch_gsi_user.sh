#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "USAGE:"
    echo "$ $0 GSI_USER"
    echo
    echo "Available users:"
    echo ls $CERTDIR/*
    exit 1
fi

# MYUSER="guest"
MYUSER=$1

# MYUSER="rodsminer"
# export IRODS_HOST=rodserver
# export IRODS_PORT=1247
# export IRODS_ZONE=tempZone

export IRODS_USER_NAME=$MYUSER
export IRODS_AUTHENTICATION_SCHEME=gsi
export IRODS_HOME=/$IRODS_ZONE/home/$MYUSER
export X509_CERT_DIR=$CERTDIR/simple_ca
export X509_USER_CERT=$CERTDIR/$MYUSER/usercert.pem
export X509_USER_KEY=$CERTDIR/$MYUSER/userkey.pem

echo "Opening a new shell. Test with:"
echo "$ ils \$IRODS_HOME/"
echo
bash
