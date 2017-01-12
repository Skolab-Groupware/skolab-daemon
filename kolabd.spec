##
##  kolabd.spec -- OpenPKG RPM Specification
##  Copyright (c) 2004-2005 Klaraelvdalens Datakonsult AB <http://www.klaralvdalens-datakonsult.se>
##  Copyright (c) 2000-2004 The OpenPKG Project <http://www.openpkg.org/>
##  Copyright (c) 2000-2004 Ralf S. Engelschall <rse@engelschall.com>
##  Copyright (c) 2000-2004 Cable & Wireless <http://www.cw.com/>
##
##  Permission to use, copy, modify, and distribute this software for
##  any purpose with or without fee is hereby granted, provided that
##  the above copyright notice and this permission notice appear in all
##  copies.
##
##  THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
##  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
##  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
##  IN NO EVENT SHALL THE AUTHORS AND COPYRIGHT HOLDERS AND THEIR
##  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
##  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
##  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
##  USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
##  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
##  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
##  OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
##  SUCH DAMAGE.
##

#   package information
Name:         kolabd
Summary:      Kolab2 Groupware Server Daemon
URL:          http://www.kolab.org/
Vendor:       Erfrakon, Intevation, Code Fusion, Klaraelvdalens Datakonsult AB
Packager:     Klaraelvdalens Datakonsult AB
Distribution: OpenPKG
Group:        Mail
License:      GPL
Version:      2.2.3
Release:      20091217

#   list of sources
Source0:      kolabd-%{version}.tar.bz2
#Source1:      rc.kolabd

#   build information
Prefix:       %{l_prefix}
BuildRoot:    %{l_buildroot}
BuildPreReq:  OpenPKG, openpkg >= 20070603
PreReq:       OpenPKG, openpkg >= 20070603

PreReq:       postfix, postfix::with_ldap = yes, postfix::with_sasl = yes, postfix::with_ssl = yes
PreReq:       sasl::with_ldap = yes, sasl::with_login = yes
PreReq:       amavisd
PreReq:       clamav >= 0.90
PreReq:       openldap, openldap::with_pth = no
PreReq:       imap, imap::with_annotate = yes
PreReq:       apache, apache::with_mod_ssl = yes, apache::with_mod_ldap = yes, apache::with_mod_authn_alias = yes
PreReq:       Kolab_Filter
PreReq:       Kolab_FreeBusy

# what about php::with_tidy = yes (for Horde Imp)
PreReq:       php, php::with_gettext = yes, php::with_dom = yes, php::with_mcrypt = yes, php::with_iconv = yes, php::with_mbstring = yes, php::with_mbregex = yes, php::with_gd = yes, php::with_imap = yes, php::with_ssl = yes, php::with_ctype = yes, php::with_openldap = yes, php::with_mhash = yes, php::with_zlib = yes, php::with_bdb = yes, php::with_imap_annotate = yes, php::with_imap_myrights = yes, php::with_pear = yes, php::with_xml = yes, php::with_mm = yes, php::with_sqlite = yes, php::with_spl = yes
PreReq:       apache-php, apache-php::with_gettext = yes, apache-php::with_dom = yes, apache-php::with_mcrypt = yes, apache-php::with_iconv = yes, apache-php::with_mbstring = yes, apache-php::with_mbregex = yes, apache-php::with_gd = yes, apache-php::with_imap = yes, apache-php::with_ssl = yes, apache-php::with_ctype = yes, apache-php::with_openldap = yes, apache-php::with_mhash = yes, apache-php::with_zlib = yes, apache-php::with_bdb = yes, apache-php::with_imap_annotate = yes, apache-php::with_imap_myrights = yes, apache-php::with_pear = yes, apache-php::with_xml = yes, apache-php::with_mm = yes, apache-php::with_sqlite = yes, php::with_spl = yes

PreReq:       imapd, imapd::with_group = yes, imapd::with_group_igncase = yes, imapd::with_ldap = yes, imapd::with_annotate = yes, imapd::with_atvdom = yes, imapd::with_morelogging = yes, imapd::with_kolab = yes
PreReq:       perl-ssl
PreReq:       perl-www
PreReq:       perl-ldap
PreReq:       perl-kolab >= 2.1.0.cvs-20070801
AutoReq:      no
AutoReqProv:  no

Provides:     kolabd::with_horde

%option       kolab_version snapshot

%description
    Kolab is the KDE Groupware Server that provides full groupware
    features to either KDE Kolab clients or Microsoft Outlook[tm]
    clients using third party plugins and web clients in the future. 
    In addition it is a robust and flexible general IMAP mail server 
    with LDAP addressbooks.

%prep
    %setup -q

%build
    ./configure --prefix=%{l_prefix} --with-dist=kolab
    %{l_make} %{l_mflags}

%install

    #   install package
    %{l_make} %{l_mflags} install \
        DESTDIR=$RPM_BUILD_ROOT

    #   generate file list
    %{l_rpmtool} files -v -ofiles -r$RPM_BUILD_ROOT %{l_files_std} \
	'%config %{l_prefix}/etc/kolab/templates/*.template' \
	%dir '%defattr(-,%{l_nusr},%{l_ngrp})' %{l_prefix}/var/kolab/httpd_sessions \
	%dir '%defattr(-,%{l_nusr},%{l_ngrp})' %{l_prefix}/var/apache/log/php

%files -f files

%clean
    rm -rf $RPM_BUILD_ROOT

%post
    %{l_shtool} echo -e "Installing crontab entry"
	# NOTE: OpenPKG's dcron package does not work currently, 
	# so we have to rely on the host system's cron:
    %{l_shtool} echo -e "`crontab -u %{l_musr} -l | grep -v '%{l_prefix}/[a-z/]*/kolabquotawarn'`" \
	| crontab - -u %{l_musr}

    echo "For a fresh install please initialize Kolab by running '$RPM_INSTALL_PREFIX/sbin/kolab_bootstrap -b' as user root."
    echo "If you upgraded from a previous version simply refresh Kolab by running run '$RPM_INSTALL_PREFIX/sbin/kolabconf' as user root."
    echo "In every case execute '$RPM_INSTALL_PREFIX/bin/openpkg rc kolabd restart' as user root."
