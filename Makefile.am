@distribution@
@common@

NULL =

# Work around to autoconf's deficiencies
distclean-local:
	rm -rf $(srcdir)/autom4te*.cache

# is sometimes used in this file
kolabconfdir = $(sysconfdir)/kolab

kolabdir = $(kolab_scriptsdir)

kolab_SCRIPTS = $(KOLAB_SCRIPTS_FILES)					\
	kolab_sslcert.sh						\
	kolab_ca.sh							\
	$(NULL)

kolabspecialdir = $(kolabconfdir)
kolabspecial_DATA = kolab.globals

kolabconfig_FILES = rootDSE.ldif

kolabconfigdir = $(kolabconfdir)
dist_kolabconfig_DATA = $(kolabconfig_FILES)

kolabfixedtemplatedir = $(kolabconfdir)/templates
kolabfixedtemplate_FILES =						\
	templates/amavisd.conf.template					\
	templates/access.template					\
	templates/canonical.template					\
	templates/clamd.conf.template					\
	templates/cyrus.conf.template					\
	templates/DB_CONFIG.slapd.template				\
	templates/freshclam.conf.template				\
	templates/header_checks.template				\
	templates/httpd.conf.template					\
	templates/httpd.local.template					\
	templates/imapd.annotation_definitions.template			\
	templates/imapd.conf.template					\
	templates/imapd.group.template					\
	templates/kolab.conf.template					\
	templates/kolab_smtpdpolicy.conf.template			\
	templates/ldap.conf.template					\
	templates/ldapdistlist.cf.template				\
	templates/ldaptransport.cf.template				\
	templates/ldapvirtual.cf.template				\
	templates/local.cf.template					\
	templates/main.cf.template					\
	templates/master.cf.template					\
	templates/php.ini.template					\
	templates/rc.conf.template					\
	templates/relocated.template					\
	templates/saslauthd.conf.template				\
	templates/slapd.access.template					\
	templates/slapd.conf.template					\
	templates/slapd.replicas.template				\
	templates/smtpd.conf.template					\
	templates/transport.template					\
	templates/virtual.template					\
	$(NULL)

dist_kolabfixedtemplate_DATA = $(kolabfixedtemplate_FILES)

kolabnamespace_FILES = namespace/libexec/newconfig			\
	namespace/libexec/adduser					\
	namespace/libexec/deluser					\
	namespace/libexec/listusers					\
	namespace/libexec/showuser					\
	namespace/libexec/services					\
	namespace/libexec/showlog					\
	namespace/libexec/start						\
	namespace/libexec/stop						\
	$(NULL)

kolabnamespacedir = $(libexecdir)/kolab
kolabnamespace_DATA = $(kolabnamespace_FILES)


ldapschema_FILES =  kolab2.schema

ldapschemadir = $(ldapserver_schemadir)
dist_ldapschema_DATA = $(ldapschema_FILES)


amavisdus_FILES = amavisd/en_US/charset					\
	amavisd/en_US/template-dsn.txt					\
	amavisd/en_US/template-spam-admin.txt				\
	amavisd/en_US/template-spam-sender.txt				\
	amavisd/en_US/template-virus-admin.txt				\
	amavisd/en_US/template-virus-recipient.txt			\
	amavisd/en_US/template-virus-sender.txt				\
	$(NULL)

amavisdusdir = $(amavisd_templatedir)/en_US
dist_amavisdus_DATA = $(amavisdus_FILES)


amavisdde_FILES = amavisd/de/charset					\
	amavisd/de/template-dsn.txt					\
	amavisd/de/template-spam-admin.txt				\
	amavisd/de/template-spam-sender.txt				\
	amavisd/de/template-virus-admin.txt				\
	amavisd/de/template-virus-recipient.txt				\
	amavisd/de/template-virus-sender.txt				\
	$(NULL)

amavisddedir = $(amavisd_templatedir)/de
dist_amavisdde_DATA = $(amavisdde_FILES)


kolabdoc_FILES = doc/README.ldapdelete					\
	doc/README.outlook						\
	doc/README.sieve						\
	ChangeLog							\
	COPYING								\
	NEWS								\
	AUTHORS								\
	$(NULL)

kolabdoc_GENERATED = doc/README.amavisd					\
	doc/README.webgui						\
	$(NULL)

kolabdocdir = $(pkgdocdir)/@PACKAGE@
kolabdoc_DATA = $(kolabdoc_FILES) $(kolabdoc_GENERATED)

kolabsbin_FILES = dist_conf/kolabsrv

kolabsbindir = $(sbindir)/
kolabsbin_DATA = $(kolabsbin_FILES)


kolabbindir = $(bindir)

kolabbin_DATA = $(KOLABBIN_FILES)

generated_files = $(kolabspecial_DATA)					\
	$(kolabtemplate_DATA)						\
	$(kolabdoc_GENERATED)						\
	dist_conf/kolabsrv						\
	$(NULL)

generated_executables = $(kolabsbin_DATA)				\
	$(kolab_SCRIPTS)						\
	$(kolabbin_DATA)						\
	$(kolabrc_DATA)							\
	$(kolabnamespace_DATA)						\
	$(NULL)

EXTRA_DIST = 
CLEANFILES =

EXTRA_DIST += $(patsubst %,%.in,$(generated_executables) $(generated_files))
EXTRA_DIST += $(kolabdoc_FILES)

CLEANFILES += $(generated_files) $(generated_executables)


$(generated_files): %: %.in
	@$(mkinstalldirs) . templates/ doc/ dist_conf/
	$(do_subst) <$(srcdir)/$< >$@

$(generated_executables): %: %.in
	@$(mkinstalldirs) . namespace/ namespace/libexec/ 
	$(do_subst) <$(srcdir)/$< >$@
	chmod a+x $@


# Please update the perl-kolab, kolab-webadmin and kolab-resource-handlers
# Makefile.ams too when the underneath EXTRA_DIST assignment is altered
EXTRA_DIST += dist_conf/common						\
	dist_conf/debian						\
	dist_conf/kolab							\
	dist_conf/kolabsrv						\
	dist_conf/mandriva						\
	dist_conf/suse							\
	$(NULL)

install-data-hook:
	$(mkinstalldirs) -m 755 $(DESTDIR)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(kolab_logdir)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(kolab_hooksdir)/delete
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/cgi-bin
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/icons
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/freebusy
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_logdir)/php
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_sessions)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(kolab_statedir)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/locks
	chmod 644 $(DESTDIR)$(kolabconfdir)/kolab.globals
	chmod 775 $(DESTDIR)$(kolabdir)$(kolab_FILES)
	chmod 755 $(DESTDIR)$(kolabnamespacedir)/*
	chmod 755 $(DESTDIR)$(sbindir)/kolabsrv
