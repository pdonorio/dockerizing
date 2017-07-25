#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage $0 SCRIPT_NAME"
    exit 1
fi

# Clean
SCRIPT=$1
rm -rf $SCRIPT && touch $SCRIPT

##############################
# Unix account

# account
echo "$IRODS_USER" >> $SCRIPT
# group
echo "$IRODS_USER" >> $SCRIPT
# iRODS server's role
echo "1" >> $SCRIPT
# ODBC driver for postgres
echo "1" >> $SCRIPT

##############################
# DB account

## server host name
echo "$POSTGRES_HOST" >> $SCRIPT
## db port 5432
echo "5432" >> $SCRIPT
# database name
echo "$IRODS_DB" >> $SCRIPT
# database username
echo "$POSTGRES_USER" >> $SCRIPT
# confirmation
echo "yes" >> $SCRIPT
# irods password
echo "$POSTGRES_PASSWORD" >> $SCRIPT
# salt password
echo "$POSTGRES_PASSWORD" >> $SCRIPT

##############################
# IRODS setup

# irods zone
echo "$IRODS_ZONE" >> $SCRIPT
# irods port
echo "$IRODS_PORT" >> $SCRIPT
# range begin
echo "20000" >> $SCRIPT
# range end
echo "20199" >> $SCRIPT
# control plane port
echo "1248" >> $SCRIPT
# schema (default)
echo "" >> $SCRIPT
# irods administrator
echo "$IRODS_USER" >> $SCRIPT
# confirmation
echo "yes" >> $SCRIPT

# zone key
(openssl rand -base64 16 2>/dev/null | sed 's,/,S,g' | sed 's,+,_,g' \
    | cut -c 1-16  | tr -d '\n' ; echo "") >> $SCRIPT
# negotation key
openssl rand -base64 32 2> /dev/null | sed 's,/,S,g' | sed 's,+,_,g' | cut -c 1-32 \
    >> $SCRIPT
# control plane key
openssl rand -base64 32 2> /dev/null | sed 's,/,S,g' | sed 's,+,_,g' | cut -c 1-32 \
    >> $SCRIPT
# admin password
echo "$IRODS_PASSWORD" >> $SCRIPT
# vault
echo "" >> $SCRIPT

echo "created irods expectation"
