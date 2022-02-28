#!/usr/bin/perl
#
# This code has be copied from:
# server/skolabconf/lib/Skolab/Conf.pm cvs version 1.12
#
# $Id$
#
# This script converts a template file to an example config.php file.
# It does this for the resmgr.conf.template.in and freebusy.conf.template.in
# templates.  The resulting file is a combination of the template file
# name and the suffix _config.php.  The resulting example config files are
# to be copied to the correct cvs module.  See the template file.

use IO::File;

$Skolab::config{"skolabfilter-verify-from-header"} = "true";
$Skolab::config{"skolabfilter-allow-sender-header"} = "true";
$Skolab::config{"skolabfilter-reject-forged-from-header"} = "false";

# The script has to be run from:
# server/skolabd/skolabd/templates
my @configs;
my @metatemplates;
$metatemplates[0] = 'resmgr.conf.template.in';
$metatemplates[1] = 'freebusy.conf.template.in';

$configs[0] = 'resmgr.conf_config.php';
$configs[1] = 'freebusy.conf_config.php';

for ($file_id=0; $file_id<=1; $file_id++) {
$template = IO::File->new($metatemplates[$file_id], 'r');
$config = IO::File->new($configs[$file_id], 'w');

my $skip = 0;
my $keep = 0;
while (<$template>) {

    #Eat the meta data sections
    if (/^SKOLAB_META_START$/) {
      my $found_end;
      while (!$found_end) {
        $_ = <$template>;
        $found_end = /^SKOLAB_META_END$/;
      }
      $_ = <$template>;
    }

    s%\@{3}connect_addr\@{3}%localhost%g;
    s%\@{3}local_addr\@{3}%localhost%g;
    s%\@{3}postfix-mydomain\@{3}%example.com%g;
    s%\@{3}ldap_uri\@{3}%ldaps://ldap.example.com%g;
    s%\@{3}base_dn\@{3}%dc=example,dc=com%g;
    s%\@{3}php_dn\@{3}%cn=nobody,cn=internal,dc=example,dc=com%g;
    s%\@{3}php_pw\@{3}%xyz%g;
    s%\@{3}postfix-mydomain\@{3}%example.com%g;
    s%\@{3}skolabhost.*\@{3}%one.example.com,two.example.com,three.example.com%g;
    s%\@{3}base_dn\@{3}%dc=example,dc=com%g;
    s%\@{3}calendar_id\@{3}%calendar%g;
    s%\@{3}calendar_pw\@{3}%zyx%g;
    s%\@{3}fqdnhostname\@{3}%example.com%g;
    s%\@webserver_web_prefix\@%%g;
    s%\@resmgr_logdir\@%/skolab/var/skolab-filter/log%g;
    s%\@resmgr_tmpdir\@%%g;
    s%\@sysconfdir\@%/skolab/etc%g;
    s%\@freebusy_logdir\@%/skolab/var/skolab-freebusy/log%g;
    s%\@freebusy_cachedir\@%/skolab/var/skolab-freebusy/cache%g;

    if (/\@{3}if (\S+?)\@{3}/) {
      # print STDERR "DEBUG: " . $1 . "\n";
      if ($Skolab::config{$1} && lc($Skolab::config{$1}) ne "false" ) {
        # Keep text
        $keep = 1;
      } else {
        # Skip text
        $skip++;
        $keep = 0;
      }
      s/\@{3}if (\S+?)\@{3}\n?//;
    } elsif (/\@{3}else\@{3}/) {
      if( $keep == 0 ) {
        # Now keep
        $keep = 1;
        $skip--;
      } else {
        # Now skip
        $keep = 0;
        $skip++;
      }
      s/\@{3}else\@{3}\n?//;
    } elsif (/\@{3}endif\@{3}/) {
      ($skip > 0) && $skip--;
      s/\@{3}endif\@{3}\n?//;
    }  else {
      while (/\@{3}([^\s\@]+?)(\|(.+?)\((.*)\))?\@{3}/) {
        my $attr = $1;
        my $fct  = $3;
        my $args = $4;
        # print STDERR "attr=\"$attr\", fct=\"$fct\", args=\"$args\"\n";
        # print STDERR "config=" . $Skolab::config{$attr} . "\n";

        $val = $Skolab::config{$attr};
        s/\@{3}([^\s\@]+?)(\|.+?)?\@{3}/$val/;
        last if ( $val eq "\@{3}$attr\@{3}" ); # prevent endless loop
      }
    }

    if ($skip == 0) {
       # Change the resulting string ('true'='TRUE') in just true
       # If there is a better a way, to achieve the same result please
       # update the script.
       s/\('true/true/;
       s/'=='TRUE'\)//;
       print $config $_;
    }
  }

  $config->close;
  $template->close;
}

