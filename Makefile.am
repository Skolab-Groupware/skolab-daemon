@distribution@
@common@

NULL =

# Work around to autoconf's deficiencies
distclean-local:
	rm -rf $(srcdir)/autom4te*.cache

# is sometimes used in this file
skolabconfdir = $(sysconfdir)/skolab

skolabdir = $(skolab_scriptsdir)

skolab_SCRIPTS = $(SKOLAB_SCRIPTS_FILES)				\
	skolab_sslcert.sh						\
	skolab_ca.sh							\
	$(NULL)

skolabspecialdir = $(skolabconfdir)
skolabspecial_DATA = skolab.globals

skolabconfig_FILES = rootDSE.ldif

skolabconfigdir = $(skolabconfdir)
dist_skolabconfig_DATA = $(skolabconfig_FILES)

skolabfixedtemplatedir = $(skolabconfdir)/templates
skolabfixedtemplate_FILES =						\
	templates/amavis\:\:40-skolab.template				\
	templates/apache\:\:httpd.conf.template				\
	templates/apache\:\:httpd.local.template			\
	templates/apache\:\:php.ini.template				\
	templates/clamav\:\:clamd.conf.template				\
	templates/clamav\:\:freshclam.conf.template			\
	templates/cyrus-imap\:\:cyrus.conf.template			\
	templates/cyrus-imap\:\:imapd.annotation_definitions.template	\
	templates/cyrus-imap\:\:imapd.conf.template			\
	templates/cyrus-imap\:\:imapd.group.template			\
	templates/postfix\:\:canonical.template				\
	templates/postfix\:\:header_checks.template			\
	templates/postfix\:\:skolab_smtpdpolicy.conf.template		\
	templates/postfix\:\:ldapdistlist.cf.template			\
	templates/postfix\:\:ldaptransport.cf.template			\
	templates/postfix\:\:ldapvirtual.cf.template			\
	templates/postfix\:\:main.cf.template				\
	templates/postfix\:\:master.cf.template				\
	templates/postfix\:\:relocated.template				\
	templates/postfix\:\:smtpd.conf.template			\
	templates/postfix\:\:transport.template				\
	templates/postfix\:\:virtual.template				\
	templates/postix\:\:access.template				\
	templates/saslauthd\:\:saslauthd.conf.template			\
	templates/skolab\:\:skolab.conf.template			\
	templates/skolab\:\:rc.conf.template				\
	templates/slapd\:\:DB_CONFIG.template				\
	templates/slapd\:\:ldap.conf.template				\
	templates/slapd\:\:slapd.access.template			\
	templates/slapd\:\:slapd.conf.template				\
	templates/slapd\:\:slapd.replicas.template			\
	templates/spamassassin\:\:local.cf.template			\
	$(NULL)

dist_skolabfixedtemplate_DATA = $(skolabfixedtemplate_FILES)

skolabnamespace_FILES = namespace/libexec/newconfig			\
	namespace/libexec/adduser					\
	namespace/libexec/deluser					\
	namespace/libexec/listusers					\
	namespace/libexec/showuser					\
	namespace/libexec/services					\
	namespace/libexec/showlog					\
	namespace/libexec/start						\
	namespace/libexec/stop						\
	$(NULL)

skolabnamespacedir = $(libexecdir)/skolab
skolabnamespace_DATA = $(skolabnamespace_FILES)


ldapschema_FILES = skolab2.schema

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


skolabdoc_FILES = doc/README.ldapdelete					\
	doc/README.outlook						\
	doc/README.sieve						\
	NEWS								\
	AUTHORS								\
	$(NULL)

skolabdoc_GENERATED = doc/README.amavisd					\
	doc/README.webgui						\
	$(NULL)

skolabdocdir = $(pkgdocdir)
skolabdoc_DATA = $(skolabdoc_FILES) $(skolabdoc_GENERATED)

skolabsbin_FILES = dist_conf/skolabsrv

skolabsbindir = $(sbindir)/
skolabsbin_DATA = $(skolabsbin_FILES)


skolabbindir = $(bindir)

skolabbin_DATA = $(SKOLABBIN_FILES)

generated_files = $(skolabspecial_DATA)					\
	$(skolabtemplate_DATA)						\
	$(skolabdoc_GENERATED)						\
	dist_conf/skolabsrv						\
	$(NULL)

generated_executables = $(skolabsbin_DATA)				\
	$(skolab_SCRIPTS)						\
	$(skolabbin_DATA)						\
	$(skolabrc_DATA)							\
	$(skolabnamespace_DATA)						\
	$(NULL)

EXTRA_DIST = 
CLEANFILES =

EXTRA_DIST += $(patsubst %,%.in,$(generated_executables) $(generated_files))
EXTRA_DIST += $(skolabdoc_FILES)

CLEANFILES += $(generated_files) $(generated_executables)


$(generated_files): %: %.in
	@$(mkinstalldirs) . templates/ doc/ dist_conf/
	$(do_subst) <$(srcdir)/$< >$@

$(generated_executables): %: %.in
	@$(mkinstalldirs) . namespace/ namespace/libexec/ 
	$(do_subst) <$(srcdir)/$< >$@
	chmod a+x $@


# Please update the perl-skolab, skolab-webadmin and skolab-resource-handlers
# Makefile.ams too when the underneath EXTRA_DIST assignment is altered
EXTRA_DIST += dist_conf/common						\
	dist_conf/debian						\
	dist_conf/skolabsrv						\
	$(NULL)

install-data-hook:
	$(mkinstalldirs) -m 755 $(DESTDIR)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(skolab_logdir)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(skolab_hooksdir)/delete
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/cgi-bin
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/icons
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/freebusy
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_logdir)/php
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_sessions)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(skolab_statedir)
	$(mkinstalldirs) -m 755 $(DESTDIR)$(webserver_document_root)$(webserver_web_prefix)/locks
	chmod 644 $(DESTDIR)$(skolabconfdir)/skolab.globals
	chmod 775 $(DESTDIR)$(skolabdir)$(skolab_FILES)
	chmod 755 $(DESTDIR)$(skolabnamespacedir)/*
	chmod 755 $(DESTDIR)$(sbindir)/skolabsrv
