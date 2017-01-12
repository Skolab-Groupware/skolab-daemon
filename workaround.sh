#!/bin/sh
# (c) 2003 Tassilo Erlewein <tassilo.erlewein@erfrakon.de>
# (c) 2003 Martin Konold <martin.konold@erfrakon.de>
# This program is Free Software under the GNU General Public License (>=v2).
# Read the file COPYING that comes with this packages for details.


/kolab/bin/cyradm --user manager --password $2 localhost <<EOF
lam $1
quit
EOF
