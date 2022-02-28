Skolab use of Sieve scripts
===========================

Last edited: $Id$

Compatibility
-------------

The Skolab webgui uses up to 3 sieve scripts with specific name per user:

skolab-deliver.siv
skolab-forward.siv
skolab-vacation.siv

Only one script can be active at the time. If the user wants to install 
a custom sieve script, a name not conflicting with the skolab scripts
must be chosen.

Each of the 3 scripts must strictly follow the template wrt. linebreaks 
etc. to be parsable by the skolab webgui and the skolab clients (kontact)
as described below:

skolab-deliver.siv:
-------------------

This script allows the user to deliver all non-scheduling mail to a 
folder of his choice.

require "fileinto";
if header :contains ["X-Skolab-Scheduling-Message"] ["FALSE"] {
fileinto "<FOLDERNAME>";
}

where <FOLDERNAME> is the name of the IMAP folder mail should be 
delivered to.

skolab-forward.siv
------------------

This script allows the user to forward his mail to a different mailbox, 
optionally keep a copy of each message on the server.

Without "keep copy on server":

redirect "<EMAILADDR>";

With "keep copy on server":

redirect "steffen@klaralvdalens-datakonsult.se"; keep;

skolab-vacation.siv
-------------------

require "vacation";

if not address :domain :contains "From" "<DOMAIN>" { keep; stop; }
if header :contains "X-Spam-Flag" "YES" { keep; stop; }
vacation :addresses [ <EMAILADDRS> ] :days <DAYS> text:
<OUT_OF_OFFICE_TEXT>

.
;

<OUT_OF_OFFICE_TEXT> is the vacation message sent out, 
<DAYS> the number of days to wait before a vacation message can be 
       send to the same recipient again, 
<EMAILADDRS> is a comma-separated list of "-quoted email addresses 
       that the vacation script will answer for, and 
<DOMAIN> is a domain name in case the option "Only react to mail 
         coming from domain" is enabled. If this option is not 
         enabled, this entire line of the script should be missing. 

Similar for the line with "X-Spam-Flag" in it -- it should only be 
in the script if the user has enabled the option "Do not send 
vacation replies to spam messages" is enabled.
