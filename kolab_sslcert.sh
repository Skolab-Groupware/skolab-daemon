#!/bin/sh

##  Copyright (c) 2003 Martin Konold <martin.konold@erfrakon.de>
##  Copyright (c) 2003 Tassilo Erlewein <tassilo.erlewein@erfrakon.de>
##  This program is Free Software under the GNU General Public License (>=v2).
##  Read the file COPYING that comes with this packages for details.


cd @l_prefix@/etc/kolab

if [ $1 ];then
  HN=$1
else
  HN=`hostname -f`
fi

echo "[ req ]" > tmp.req.cnf
echo "distinguished_name = req_distinguished_name" >> tmp.req.cnf
echo "default_bits = 1024" >> tmp.req.cnf
echo "prompt = no" >> tmp.req.cnf
echo "x509_extensions = v3_req" >> tmp.req.cnf
echo >> tmp.req.cnf
echo "string_mask = nombstr" >> tmp.req.cnf
echo >> tmp.req.cnf
echo "[ req_distinguished_name ]" >> tmp.req.cnf
echo "CN = $HN" >> tmp.req.cnf
echo >> tmp.req.cnf
echo "[ v3_req ]" >> tmp.req.cnf
echo "basicConstraints = CA:TRUE" >> tmp.req.cnf

echo -n "generate self-signed certificate for hostname $HN... "

    /kolab/bin/openssl req -new -x509 -outform PEM -keyform PEM -nodes \
                                   -days 3650 -out cert.pem -keyout key.pem \
		                   -config tmp.req.cnf >/dev/null 2>&1
echo "done"

chgrp @l_rusr@ key.pem
chmod 0640 key.pem
chgrp @l_rusr@ cert.pem
chmod 0640 cert.pem

#rm -f tmp.req.cnf

cd -

echo "New certificate has been installed under @l_prefix@/etc/kolab/"
