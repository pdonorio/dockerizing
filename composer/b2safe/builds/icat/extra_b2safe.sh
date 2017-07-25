#!/bin/bash

# GSI & certificates
add-irods-X509 rodsminer admin
add-irods-X509 guest

# # More?
# echo "Extra!"

echo -e "echo\\necho 'Become irods administrator user with the command:'\\necho '$ berods'" >> /root/.bashrc
echo -e "echo\\necho 'Switch irods GSI user then with the command:'\\necho '$ switch-gsi USERNAME'\\necho" >> /root/.bashrc

################################
## Add and validate the B2ACCESS certification authority
cd $CADIR
# mkdir -p /etc/grid-security/certificates

## DEV
label="b2access.ca.dev"

cp $B2ACCESS_CAS/$label.* $CADIR/
caid=$(openssl x509 -in $label.pem -hash -noout)
echo "B2ACCESS CA [dev]: label is $caid"
mv $label.pem ${caid}.0
mv $label.signing_policy ${caid}.signing_policy
cp $CADIR/$caid* /etc/grid-security/certificates/

## PROD
label="b2access.ca.prod"

cp $B2ACCESS_CAS/$label.* $CADIR/
caid=$(openssl x509 -in $label.pem -hash -noout)
echo "B2ACCESS CA [prod]: label is $caid"
mv $label.pem ${caid}.0
mv $label.signing_policy ${caid}.signing_policy
cp $CADIR/$caid* /etc/grid-security/certificates/

chown -R $IRODS_USER /opt/certificates
echo "Certification authorities enabled"

################################
# Cleanup
echo "Cleaning temporary files"
rm -rf /tmp/*
