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

#   package version
%define       V_ei_maj 2.0
%define       V_ei_min 99
%define       V_cf     1.0.4

#   package information
Name:         kolabd
Summary:      Kolab2 Groupware Server Daemon
URL:          http://www.kolab.org/
Vendor:       Erfrakon, Intevation, Code Fusion, Klaraelvdalens Datakonsult AB
Packager:     Klaraelvdalens Datakonsult AB
Distribution: OpenPKG
Class:        PLUS
Group:        Mail
License:      GPL
Version:      2.1.0
Release:      20070510

#   list of sources
Source0:      kolabd-%{version}.tar.bz2
#Source1:      rc.kolabd

#   build information
Prefix:       %{l_prefix}
BuildRoot:    %{l_buildroot}
BuildPreReq:  OpenPKG, openpkg >= 2.5.0
PreReq:       OpenPKG, openpkg >= 2.5.0, openldap >= 2.3.29, imapd, sasl, apache, proftpd, perl, perl-ldap, perl-mail
PreReq:       sasl >= 2.1.19-2.2.0, sasl::with_ldap = yes, sasl::with_login = yes
PreReq:       proftpd >= 1.2.10-2.2.0, proftpd::with_ldap = yes
PreReq:       postfix >= 2.2.5, postfix::with_ldap = yes, postfix::with_sasl = yes, postfix::with_ssl = yes
PreReq:       imapd >= 2.2.12-2.5.0, imapd::with_group = yes
PreReq:       apache >= 1.3.33-2.5.0, apache::with_mod_auth_ldap = yes, apache::with_mod_dav = yes, apache::with_mod_php = yes, apache::with_mod_php_gettext = yes, apache::with_mod_php_imap = yes, apache::with_mod_php_openldap = yes, apache::with_mod_php_xml = yes, apache::with_mod_ssl = yes
PreReq:       perl-kolab >= 5.8.7-20070420, perl-db
PreReq:	      amavisd >= 2.3.3-2.5.0
PreReq:	      clamav >= 0.90-20070214
AutoReq:      no
AutoReqProv:  no

%option       kolab_version snapshot

%description
    Kolab is the KDE Groupware Server that provides full groupware
    features to either KDE Kolab clients or Microsoft Outlook[tm]
    clients using third party plugins and web clients in the future. 
    In addition it is a robust and flexible general IMAP mail server 
    with LDAP addressbooks.
    Kolab %{V_ei_maj}.%{V_ei_min}

    The Code Fusion fork adds functionality such as integration with
    Active Directory, a more modularised backend, separation of the
    daemon and the configuration generator and more.
    Code Fusion Engine %{V_cf}, shares Admin (see above)

%track
    prog kolab-ei = {
        version   = %{V_ei_maj}.%{V_ei_min}
        url       = ftp://ftp.kdab.net/pub/kolab/server/current/
        regex     = kolabd-(__VER__)\.src\.rpm
    }

%prep
    %setup -q

%build
    ./configure --prefix=%{l_prefix} --with-dist=kolab
    %{l_make} %{l_mflags}

%install
    rm -rf $RPM_BUILD_ROOT

    #   install package
    %{l_make} %{l_mflags} install \
        DESTDIR=$RPM_BUILD_ROOT

    #   generate file list
    %{l_rpmtool} files -v -ofiles -r$RPM_BUILD_ROOT %{l_files_std} \
	%dir '%defattr(-,%{l_nusr},%{l_ngrp})' %{l_prefix}/var/kolab/httpd_sessions \
        '%config %{l_prefix}/etc/kolab/*.pem' \
        '%config %{l_prefix}/etc/kolab/*.schema' \
        '%config %{l_prefix}/etc/kolab/kolab.conf' \
	'%config %{l_prefix}/etc/kolab/quotawarning.txt' \
	'%config %{l_prefix}/etc/kolab/templates/*.template'

%files -f files

%clean
    rm -rf $RPM_BUILD_ROOT

%post
    %{l_shtool} echo -e "Installing crontab entry"
	# NOTE: OpenPKG's dcron package does not work currently, 
	# so we have to rely on the host system's cron:
    %{l_shtool} echo -e "`crontab -u %{l_musr} -l | grep -v %{l_prefix}/etc/kolab/kolabquotawarn`" \
	'
*/10 * * * * %{l_prefix}/etc/kolab/kolabquotawarn' | crontab - -u %{l_musr}

    echo "For a fresh install please initialize Kolab by running '$RPM_INSTALL_PREFIX/etc/kolab/kolab_bootstrap -b' as user root."
    echo "If you upgraded from a previous version simply refresh Kolab by running run '$RPM_INSTALL_PREFIX/sbin/kolabconf' as user root."
    echo "In every case execute '$RPM_INSTALL_PREFIX/bin/openpkg rc kolabd restart' as user root."
