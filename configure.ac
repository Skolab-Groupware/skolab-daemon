AC_PREREQ(2.59)

AC_INIT([skolab-daemon], m4_esyscmd([cat VERSION | tr -d '\n']),[https://github.com/Skolab-Groupware/skolab-daemon/issues])
AC_CONFIG_AUX_DIR(.)

AM_INIT_AUTOMAKE([gnu] [1.7] [dist-bzip2] [no-dist-gzip])
AC_PREFIX_DEFAULT([/usr])

common=dist_conf/common
AC_SUBST_FILE(common)

AC_ARG_WITH([dist],
  [AC_HELP_STRING([--with-dist=DIST],
     [distribution target (default: openpkg)])],
     [distribution=$srcdir/dist_conf/$withval],
   [distribution=$srcdir/dist_conf/kolab])

AS_IF([test -f $distribution],,
	AC_MSG_ERROR([incorrect value for --with-dist: $withval])
)
AC_SUBST_FILE(distribution)

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([
Makefile
])

AC_OUTPUT
