#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 USERNAME"
    exit 1
fi
MYUSER="$1"
mydir="$CERTDIR/$MYUSER"
mkdir -p $mydir

##############################
# CA authority
if [ ! -d "/etc/grid-security/certificates" ]; then
    grid-ca-create -noint -dir $CERTDIR/simple_ca
    yes 1 | grid-default-ca
    cp /etc/grid-security/certificates/* $CERTDIR/simple_ca/
fi
# grid-default-ca -list

# HOST
if [ ! -s "$CERTDIR/host/hostcert.pem" ]; then
    yes | grid-cert-request -host $HOSTNAME -force -dir $CERTDIR/host
    yes globus | grid-ca-sign -dir $CERTDIR/simple_ca \
        -in $CERTDIR/host/hostcert_request.pem -out $CERTDIR/host/hostcert.pem

    mkdir -p /var/lib/irods/.globus
    ln -s /opt/certificates/host/hostkey.pem /var/lib/irods/.globus/
    ln -s /opt/certificates/host/hostcert.pem /var/lib/irods/.globus/
    echo "Created host certificate"
fi

##############################
# NEW USER

# Check
out=`su -c "iadmin lua" $IRODS_USER | grep ^$MYUSER`
if [ "$out" != "" ]; then
    echo "User $MYUSER already exists";
    exit 0
fi

# Create certificate
grid-cert-request -cn $MYUSER -dir $mydir -nopw
if [ "$?" != "0" ]; then
    echo "Failed to create the certificate"; exit 1
fi

# Sign the certificate
certin="$mydir/usercert_request.pem"
certout="$mydir/usercert.pem"
yes globus | grid-ca-sign -dir $CERTDIR/simple_ca \
    -in $certin -out $certout
# clear

# Check certificate
openssl x509 -in $certout -noout -subject
if [ "$?" == "0" ]; then
    echo "Created signed certificate"
else
    echo "Failed to create the certificate"
    exit 1
fi
chown -R $IRODS_USER $CERTDIR

# Add and configure user to irods
dn=$(openssl x509 -in $certout -noout -subject | sed 's/subject= //')
su -c "iadmin mkuser $MYUSER rodsuser; iadmin aua $MYUSER '$dn'" $IRODS_USER

# Is it admin?
if [ "$2" == "admin" ]; then
    su -c "iadmin moduser $MYUSER type rodsadmin" $IRODS_USER
fi

echo "Added '$MYUSER' to irods GSI authorized user:"
su -c "iadmin lua" $IRODS_USER
