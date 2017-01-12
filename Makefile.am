EXTRA_DIST = 
CLEANFILES =

@distribution@
@common@

noinst_HEADERS = @PACKAGE@.spec

# Work around to autoconf's deficiencies
distclean-local:
	rm -rf $(srcdir)/autom4te*.cache

# is sometimes used in this file
kolabconfdir = $(sysconfdir)/kolab

kolabdir = $(kolab_scriptsdir)

if OPENPKG
  KOLAB_SCRIPTS_FILES = kolab
endif

kolab_SCRIPTS = $(KOLAB_SCRIPTS_FILES) \
	kolab_sslcert.sh \
	kolab_ca.sh \
	kolab_bootstrap \
	workaround.sh \
	kolabquotawarn \
	kolab_upgrade \
	kolab_smtpdpolicy 


kolabconfig_FILES = kolab.conf \
	kolab.globals \
	rootDSE.ldif \
	quotawarning.txt

kolabconfigdir = $(kolabconfdir)
dist_kolabconfig_DATA = $(kolabconfig_FILES)


kolabtemplate_FILES = templates/amavisd.conf.template \
	templates/clamd.conf.template \
	templates/cyrus.conf.template \
	templates/DB_CONFIG.slapd.template \
	templates/fbview.conf.template \
	templates/freebusy.conf.template \
	templates/freshclam.conf.template \
	templates/httpd.conf.template \
	templates/httpd.local.template \
	templates/imapd.conf.template \
	templates/imapd.group.template \
	templates/kolab.conf.template \
	templates/ldap.conf.template \
	templates/main.cf.template \
	templates/master.cf.template \
	templates/ldapdistlist.cf.template \
	templates/ldaptransport.cf.template \
	templates/ldapvirtual.cf.template \
	templates/kolab_smtpdpolicy.conf.template \
	templates/php.ini.template \
	templates/proftpd.conf.template \
	templates/resmgr.conf.template \
	templates/saslauthd.conf.template \
	templates/session_vars.php.template \
	templates/slapd.access.template \
	templates/slapd.conf.template \
	templates/slapd.replicas.template \
	templates/smtpd.conf.template \
	templates/transport.template \
	templates/virtual.template

kolabtemplatedir = $(kolabconfdir)/templates
if OPENPKG
kolabtemplate_DATA = $(kolabtemplate_FILES) \
	templates/rc.conf.template
else
kolabtemplate_DATA = $(kolabtemplate_FILES)
endif


kolabnamespace_FILES = namespace/libexec/newconfig \
	namespace/libexec/adduser \
	namespace/libexec/deluser \
	namespace/libexec/listusers \
	namespace/libexec/showuser \
	namespace/libexec/newconfig \
	namespace/libexec/services \
	namespace/libexec/showlog \
	namespace/libexec/start \
	namespace/libexec/stop 

kolabnamespacedir = $(libexecdir)/kolab
kolabnamespace_DATA = $(kolabnamespace_FILES)
EXTRA_DIST += namespace/libexec/start
EXTRA_DIST += namespace/libexec/stop

ldapschema_FILES =  kolab2.schema \
	horde.schema \
	rfc2739.schema

ldapschemadir = $(ldapserver_confdir)/schema
dist_ldapschema_DATA = $(ldapschema_FILES)


amavisdus_FILES = amavisd/en_US/charset \
	amavisd/en_US/template-dsn.txt \
	amavisd/en_US/template-spam-admin.txt \
	amavisd/en_US/template-spam-sender.txt \
	amavisd/en_US/template-virus-admin.txt \
	amavisd/en_US/template-virus-recipient.txt \
	amavisd/en_US/template-virus-sender.txt

amavisdusdir = $(amavisd_templatedir)/en_US
dist_amavisdus_DATA = $(amavisdus_FILES)


amavisdde_FILES = amavisd/de/charset \
	amavisd/de/template-dsn.txt \
	amavisd/de/template-spam-admin.txt \
	amavisd/de/template-spam-sender.txt \
	amavisd/de/template-virus-admin.txt \
	amavisd/de/template-virus-recipient.txt \
	amavisd/de/template-virus-sender.txt

amavisddedir = $(amavisd_templatedir)/de
dist_amavisdde_DATA = $(amavisdde_FILES)

kolabdoc_FILES = doc/README.amavisd \
	doc/README.ldapdelete \
	doc/README.outlook \
	doc/README.sieve \
	doc/README.webgui \
	ChangeLog \
	COPYING \
	NEWS \
	AUTHORS

kolabdocdir = $(pkgdocdir)/@PACKAGE@
dist_kolabdoc_DATA = $(kolabdoc_FILES)

if OPENPKG
kolabsbin_FILES = kolabd \
	kolabconf \
	kolabcheckperm
else
kolabsbin_FILES = kolabd \
	kolabconf \
	kolabcheckperm \
	dist_conf/kolabsrv
endif	

kolabsbindir = $(sbindir)/
kolabsbin_DATA = $(kolabsbin_FILES)
EXTRA_DIST += kolabcheckperm


kolabbindir = $(bindir)

if OPENPKG
  KOLABBIN_FILES = namespace/kolab
endif

kolabbin_DATA = kolabpasswd $(KOLABBIN_FILES)


if OPENPKG
  kolabrcdir = $(kolab_rcdir)
  kolabrc_DATA = rc.kolabd
endif


kolab:
	@$(mkinstalldirs) .
	$(do_subst) <$(srcdir)/kolab.in >$@
	chmod a+x kolab
CLEANFILES += kolab
EXTRA_DIST += kolab.in

kolab_ca.sh:
	@$(mkinstalldirs) .
	 $(do_subst) <$(srcdir)/kolab_ca.sh.in >$@
	 chmod a+x kolab_ca.sh
CLEANFILES += kolab_ca.sh
EXTRA_DIST += kolab_ca.sh.in

kolab_bootstrap:
	@$(mkinstalldirs) .
	$(do_subst) <$(srcdir)/kolab_bootstrap.in >$@
	chmod a+x kolab_bootstrap
CLEANFILES += kolab_bootstrap
EXTRA_DIST += kolab_bootstrap.in

kolab_sslcert.sh:
	@$(mkinstalldirs) .
	$(do_subst) <$(srcdir)/kolab_sslcert.sh.in >$@
	chmod a+x kolab_sslcert.sh
CLEANFILES += kolab_sslcert.sh
EXTRA_DIST += kolab_sslcert.sh.in

kolabconf:
	@$(mkinstalldirs) .
	 $(do_subst) <$(srcdir)/kolabconf.in >$@
	 chmod a+x kolabconf
CLEANFILES += kolabconf
EXTRA_DIST += kolabconf.in

kolabcheckperm:
	@$(mkinstalldirs) .
	$(do_subst) <$(srcdir)/kolabcheckperm.in >$@
CLEANFILES += kolabcheckperm
EXTRA_DIST += kolabcheckperm.in

kolabd:
	@$(mkinstalldirs) .
	 $(do_subst) <$(srcdir)/kolabd.in >$@
	 chmod a+x kolabd
CLEANFILES += kolabd
EXTRA_DIST += kolabd.in

kolabpasswd:
	@$(mkinstalldirs) .
	 $(do_subst) <$(srcdir)/kolabpasswd.in >$@
	 chmod a+x kolabpasswd
CLEANFILES += kolabpasswd
EXTRA_DIST += kolabpasswd.in

kolabquotawarn:
	@$(mkinstalldirs) .
	 $(do_subst) <$(srcdir)/kolabquotawarn.in >$@
	 chmod a+x kolabquotawarn
CLEANFILES += kolabquotawarn
EXTRA_DIST += kolabquotawarn.in

namespace/libexec/adduser:
	@$(mkinstalldirs) namespace/libexec
	 $(do_subst) <$(srcdir)/namespace/libexec/adduser.in >$@
	 chmod a+x namespace/libexec/adduser
CLEANFILES += namespace/libexec/adduser
EXTRA_DIST += namespace/libexec/adduser.in

namespace/libexec/deluser:
	@$(mkinstalldirs) namespace/libexec
	$(do_subst) <$(srcdir)/namespace/libexec/deluser.in >$@
	chmod a+x namespace/libexec/deluser
CLEANFILES += namespace/libexec/deluser
EXTRA_DIST += namespace/libexec/deluser.in

namespace/libexec/listusers:
	@$(mkinstalldirs) namespace/libexec
	$(do_subst) <$(srcdir)/namespace/libexec/listusers.in >$@
	chmod a+x namespace/libexec/listusers
CLEANFILES += namespace/libexec/listusers
EXTRA_DIST += namespace/libexec/listusers.in

namespace/libexec/newconfig:
	@$(mkinstalldirs) namespace/libexec
	$(do_subst) <$(srcdir)/namespace/libexec/newconfig.in >$@
	chmod a+x namespace/libexec/newconfig
CLEANFILES += namespace/libexec/newconfig
EXTRA_DIST += namespace/libexec/newconfig.in

namespace/libexec/services:
	@$(mkinstalldirs) namespace/libexec
	$(do_subst) <$(srcdir)/namespace/libexec/services.in >$@
	chmod a+x namespace/libexec/services
CLEANFILES += namespace/libexec/services
EXTRA_DIST += namespace/libexec/services.in

namespace/libexec/showlog:
	@$(mkinstalldirs) namespace/libexec
	$(do_subst) <$(srcdir)/namespace/libexec/showlog.in >$@
	chmod a+x namespace/libexec/showlog
CLEANFILES += namespace/libexec/showlog
EXTRA_DIST += namespace/libexec/showlog.in

namespace/libexec/showuser:
	@$(mkinstalldirs) namespace/libexec
	$(do_subst) <$(srcdir)/namespace/libexec/showuser.in >$@
	chmod a+x namespace/libexec/showuser
CLEANFILES += namespace/libexec/showuser
EXTRA_DIST += namespace/libexec/showuser.in

namespace/libexec/start:
	@$(mkinstalldirs) namespace/libexec
	$(do_subst) <$(srcdir)/namespace/libexec/start.in >$@
	chmod a+x namespace/libexec/start
CLEANFILES += namespace/libexec/start
EXTRA_DIST += namespace/libexec/start.in

namespace/libexec/stop:
	@$(mkinstalldirs) namespace/libexec
	$(do_subst) <$(srcdir)/namespace/libexec/stop.in >$@
	chmod a+x namespace/libexec/stop
CLEANFILES += namespace/libexec/stop
EXTRA_DIST += namespace/libexec/stop.in

namespace/kolab:
	@$(mkinstalldirs) namespace/
	$(do_subst) <$(srcdir)/namespace/kolab.in >$@
	chmod a+x namespace/kolab
CLEANFILES += namespace/kolab
EXTRA_DIST += namespace/kolab.in

templates/clamd.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/clamd.conf.template.in >$@
CLEANFILES += templates/clamd.conf.template
EXTRA_DIST += templates/clamd.conf.template.in

templates/cyrus.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/cyrus.conf.template.in >$@
CLEANFILES += templates/cyrus.conf.template
EXTRA_DIST += templates/cyrus.conf.template.in

templates/DB_CONFIG.slapd.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/DB_CONFIG.slapd.template.in >$@
CLEANFILES += templates/DB_CONFIG.slapd.template
EXTRA_DIST += templates/DB_CONFIG.slapd.template.in

templates/fbview.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/fbview.conf.template.in >$@
CLEANFILES += templates/fbview.conf.template
EXTRA_DIST += templates/fbview.conf.template.in

templates/freebusy.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/freebusy.conf.template.in >$@
CLEANFILES += templates/freebusy.conf.template
EXTRA_DIST += templates/freebusy.conf.template.in

templates/freshclam.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/freshclam.conf.template.in >$@
CLEANFILES += templates/freshclam.conf.template
EXTRA_DIST += templates/freshclam.conf.template.in

templates/httpd.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/httpd.conf.template.in >$@
CLEANFILES += templates/httpd.conf.template
EXTRA_DIST += templates/httpd.conf.template.in

templates/httpd.local.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/httpd.local.template.in >$@
CLEANFILES += templates/httpd.local.template
EXTRA_DIST += templates/httpd.local.template.in

templates/imapd.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/imapd.conf.template.in >$@
CLEANFILES += templates/imapd.conf.template
EXTRA_DIST += templates/imapd.conf.template.in

templates/imapd.group.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/imapd.group.template.in >$@
CLEANFILES += templates/imapd.group.template
EXTRA_DIST += templates/imapd.group.template.in

templates/kolab.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/kolab.conf.template.in >$@
CLEANFILES += templates/kolab.conf.template
EXTRA_DIST += templates/kolab.conf.template.in

templates/ldap.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/ldap.conf.template.in >$@
CLEANFILES += templates/ldap.conf.template
EXTRA_DIST += templates/ldap.conf.template.in

templates/ldapdistlist.cf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/ldapdistlist.cf.template.in >$@
CLEANFILES += templates/ldapdistlist.cf.template
EXTRA_DIST += templates/ldapdistlist.cf.template.in

templates/ldaptransport.cf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/ldaptransport.cf.template.in >$@
CLEANFILES += templates/ldaptransport.cf.template
EXTRA_DIST += templates/ldaptransport.cf.template.in

templates/ldapvirtual.cf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/ldapvirtual.cf.template.in >$@
CLEANFILES += templates/ldapvirtual.cf.template
EXTRA_DIST += templates/ldapvirtual.cf.template.in

templates/main.cf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/main.cf.template.in >$@
CLEANFILES += templates/main.cf.template
EXTRA_DIST += templates/main.cf.template.in

templates/master.cf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/master.cf.template.in >$@
CLEANFILES += templates/master.cf.template
EXTRA_DIST += templates/master.cf.template.in

templates/kolab_smtpdpolicy.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/kolab_smtpdpolicy.conf.template.in >$@
CLEANFILES += templates/kolab_smtpdpolicy.conf.template
EXTRA_DIST += templates/kolab_smtpdpolicy.conf.template.in

templates/php.ini.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/php.ini.template.in >$@
CLEANFILES += templates/php.ini.template
EXTRA_DIST += templates/php.ini.template.in

templates/proftpd.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/proftpd.conf.template.in >$@
CLEANFILES += templates/proftpd.conf.template
EXTRA_DIST += templates/proftpd.conf.template.in

templates/rc.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/rc.conf.template.in >$@
CLEANFILES += templates/rc.conf.template
EXTRA_DIST += templates/rc.conf.template.in

templates/resmgr.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/resmgr.conf.template.in >$@
CLEANFILES += templates/resmgr.conf.template
EXTRA_DIST += templates/resmgr.conf.template.in

templates/saslauthd.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/saslauthd.conf.template.in >$@
CLEANFILES += templates/saslauthd.conf.template
EXTRA_DIST += templates/saslauthd.conf.template.in

templates/session_vars.php.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/session_vars.php.template.in >$@
CLEANFILES += templates/session_vars.php.template
EXTRA_DIST += templates/session_vars.php.template.in

templates/slapd.access.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/slapd.access.template.in >$@
CLEANFILES += templates/slapd.access.template
EXTRA_DIST += templates/slapd.access.template.in

templates/slapd.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/slapd.conf.template.in >$@
CLEANFILES += templates/slapd.conf.template
EXTRA_DIST += templates/slapd.conf.template.in

templates/slapd.replicas.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/slapd.replicas.template.in >$@
CLEANFILES += templates/slapd.replicas.template
EXTRA_DIST += templates/slapd.replicas.template.in

templates/smtpd.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/smtpd.conf.template.in >$@
CLEANFILES += templates/smtpd.conf.template
EXTRA_DIST += templates/smtpd.conf.template.in

templates/transport.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/transport.template.in >$@
CLEANFILES += templates/transport.template
EXTRA_DIST += templates/transport.template.in

templates/virtual.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/virtual.template.in >$@
CLEANFILES += templates/virtual.template
EXTRA_DIST += templates/virtual.template.in

templates/amavisd.conf.template:
	@$(mkinstalldirs) templates
	$(do_subst) <$(srcdir)/templates/amavisd.conf.template.in >$@
CLEANFILES += templates/amavisd.conf.template
EXTRA_DIST += templates/amavisd.conf.template.in

workaround.sh:
	@$(mkinstalldirs) .
	 $(do_subst) <$(srcdir)/workaround.sh.in >$@
	 chmod a+x workaround.sh
CLEANFILES += workaround.sh
EXTRA_DIST += workaround.sh.in

kolab_upgrade:
	@$(mkinstalldirs) .
	$(do_subst) <$(srcdir)/kolab_upgrade.in >$@
	chmod a+x kolab_upgrade
CLEANFILES += kolab_upgrade
EXTRA_DIST += kolab_upgrade.in

kolab_smtpdpolicy:
	@$(mkinstalldirs) .
	$(do_subst) <$(srcdir)/kolab_smtpdpolicy.in >$@
	chmod a+x kolab_smtpdpolicy
CLEANFILES += kolab_smtpdpolicy
EXTRA_DIST += kolab_smtpdpolicy.in

doc/README.amavisd:
	@$(mkinstalldirs) doc
	$(do_subst) <$(srcdir)/doc/README.amavisd.in >$@
CLEANFILES += doc/README.amavisd
EXTRA_DIST += doc/README.amavisd.in

doc/README.webgui:
	@$(mkinstalldirs) doc
	$(do_subst) <$(srcdir)/doc/README.webgui.in >$@
CLEANFILES += doc/README.webgui
EXTRA_DIST += doc/README.webgui.in

rc.kolabd:
	@$(mkinstalldirs) .
	$(do_subst) <$(srcdir)/rc.kolabd.in >$@
CLEANFILES += rc.kolabd
EXTRA_DIST += rc.kolabd.in

dist_conf/kolabsrv:
	@$(mkinstalldirs) .
	$(do_subst) <$(srcdir)/dist_conf/kolabsrv.in >$@
CLEANFILES += dist_conf/kolabsrv
EXTRA_DIST += dist_conf/kolabsrv.in

# Please update the perl-kolab, kolab-webadmin and kolab-resource-handlers
# Makefile.ams too when the underneath EXTRA_DIST assignment is altered
EXTRA_DIST += dist_conf/common \
	dist_conf/debian \
	dist_conf/gentoo \
	dist_conf/kolab \
	dist_conf/mandriva \
	dist_conf/suse

install-data-hook:
	$(mkinstalldirs) -m 755 $(DESTDIR)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(kolab_logdir)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/cgi-bin
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/icons
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/freebusy
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_sessions)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(kolab_statedir)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/locks
	chmod 775 $(DESTDIR)$(kolabdir)$(kolab_FILES)
	chmod 600 $(DESTDIR)$(kolabconfigdir)/kolab.conf
	chmod 744 $(DESTDIR)$(kolabnamespacedir)/*
	chmod 744 $(DESTDIR)$(sbindir)/kolabd
	chmod 744 $(DESTDIR)$(sbindir)/kolabconf
	chmod 744 $(DESTDIR)$(sbindir)/kolabcheckperm
	chmod 755 $(DESTDIR)$(bindir)/kolabpasswd
if ! OPENPKG
	chmod 755 $(DESTDIR)$(sbindir)/kolabsrv
endif
if OPENPKG
	chmod 755 $(DESTDIR)$(kolabrcdir)/$(kolabrc_DATA)
	chmod 744 $(DESTDIR)$(bindir)/kolab
endif

