dn: dc=example,dc=com
dc: example
objectClass: top
objectClass: domain
structuralObjectClass: domain
entryUUID: 0baba734-052a-102a-80c8-de4261d934e4
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219222503Z
entryCSN: 20051219222503Z#000001#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219222503Z

dn: k=kolab,dc=example,dc=com
k: kolab
kolabHost: server.example.com
postfix-mydomain: example.com
postfix-mydestination: $mydomain
postfix-mynetworks: 127.0.0.0/8
postfix-enable-virus-scan: TRUE
cyrus-autocreatequota: 100000
cyrus-quotawarn: 80
cyrus-admins: manager
cyrus-imap: TRUE
cyrus-imaps: TRUE
cyrus-pop3s: TRUE
cyrus-sieve: TRUE
apache-allow-unauthenticated-fb: FALSE
proftpd-ftp: FALSE
uid: freebusy
userPassword:: ZnJlZWJ1c3k=
objectClass: top
objectClass: kolab
structuralObjectClass: kolab
entryUUID: 0bb32fe0-052a-102a-80c9-de4261d934e4
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219222503Z
cyrus-pop3: TRUE
apache-http: TRUE
entryCSN: 20051219223305Z#000001#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219223305Z

dn: cn=internal,dc=example,dc=com
cn: internal
objectClass: top
objectClass: kolabNamedObject
structuralObjectClass: kolabNamedObject
entryUUID: 0bba7656-052a-102a-80ca-de4261d934e4
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219222504Z
entryCSN: 20051219222504Z#000001#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219222504Z

dn: cn=external,dc=example,dc=com
cn: external
objectClass: top
objectClass: kolabNamedObject
structuralObjectClass: kolabNamedObject
entryUUID: 0bc215f0-052a-102a-80cb-de4261d934e4
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219222504Z
entryCSN: 20051219222504Z#000002#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219222504Z

dn: cn=groups,dc=example,dc=com
cn: groups
objectClass: top
objectClass: kolabNamedObject
structuralObjectClass: kolabNamedObject
entryUUID: 0bc3a05a-052a-102a-80cc-de4261d934e4
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219222504Z
entryCSN: 20051219222504Z#000003#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219222504Z

dn: cn=resources,dc=example,dc=com
cn: resources
objectClass: top
objectClass: kolabNamedObject
structuralObjectClass: kolabNamedObject
entryUUID: 0bc52682-052a-102a-80cd-de4261d934e4
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219222504Z
entryCSN: 20051219222504Z#000004#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219222504Z

dn: cn=admin,cn=internal,dc=example,dc=com
cn: admin
objectClass: top
objectClass: kolabGroupOfNames
member: cn=manager,cn=internal,dc=example,dc=com
structuralObjectClass: kolabGroupOfNames
entryUUID: 0bc6b3bc-052a-102a-80ce-de4261d934e4
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219222504Z
entryCSN: 20051219222504Z#000005#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219222504Z

dn: cn=manager,cn=internal,dc=example,dc=com
cn: manager
sn: n/a
uid: manager
userPassword:: e1NTSEF9eng5WTB0RDVCc2pEeVI2MHI4Z2hRdTBOS3JUZC9jT0I=
objectClass: top
objectClass: inetOrgPerson
objectClass: kolabInetOrgPerson
structuralObjectClass: inetOrgPerson
entryUUID: 0bce5428-052a-102a-80cf-de4261d934e4
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219222504Z
entryCSN: 20051219222504Z#000006#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219222504Z

dn: cn=nobody,cn=internal,dc=example,dc=com
cn: nobody
sn: n/a n/a
uid: nobody
userPassword:: e1NTSEF9OHAzcGxqaS9kQ1BSNEhhL2JKTkgrWW80MThodDdpZ2Y=
objectClass: top
objectClass: inetOrgPerson
objectClass: kolabInetOrgPerson
structuralObjectClass: inetOrgPerson
entryUUID: 0bd7b5cc-052a-102a-80d0-de4261d934e4
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219222504Z
entryCSN: 20051219222504Z#000007#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219222504Z

dn: cn=calendar,cn=internal,dc=example,dc=com
cn: calendar
sn: n/a n/a
uid: calendar@example.com
userPassword:: e1NTSEF9dnFCMmlXRGpZQVY5T2JLbDRHWVRud1lqMXpFUFlGS3A=
objectClass: top
objectClass: inetOrgPerson
objectClass: kolabInetOrgPerson
structuralObjectClass: inetOrgPerson
entryUUID: 0bdab72c-052a-102a-80d1-de4261d934e4
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219222504Z
entryCSN: 20051219222504Z#000008#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219222504Z

dn: cn=maintainer,cn=internal,dc=example,dc=com
cn: maintainer
objectClass: top
objectClass: kolabGroupOfNames
member: cn=manager,cn=internal,dc=example,dc=com
structuralObjectClass: kolabGroupOfNames
entryUUID: 0bdc1450-052a-102a-80d2-de4261d934e4
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219222504Z
entryCSN: 20051219222504Z#000009#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219222504Z

dn: cn=postmaster,dc=example,dc=com
objectClass: top
objectClass: kolabGroupOfNames
cn: postmaster
mail: postmaster@example.com
member: cn=user A,dc=example,dc=com
structuralObjectClass: kolabGroupOfNames
entryUUID: 24e1108a-052b-102a-9740-bb3b1276c709
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219223255Z
entryCSN: 20051219223255Z#000001#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219223255Z

dn: cn=hostmaster,dc=example,dc=com
objectClass: top
objectClass: kolabGroupOfNames
cn: hostmaster
mail: hostmaster@example.com
member: cn=user A,dc=example,dc=com
structuralObjectClass: kolabGroupOfNames
entryUUID: 24e1e6d6-052b-102a-9741-bb3b1276c709
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219223255Z
entryCSN: 20051219223255Z#000002#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219223255Z

dn: cn=abuse,dc=example,dc=com
objectClass: top
objectClass: kolabGroupOfNames
cn: abuse
mail: abuse@example.com
member: cn=user A,dc=example,dc=com
structuralObjectClass: kolabGroupOfNames
entryUUID: 24e3683a-052b-102a-9742-bb3b1276c709
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219223255Z
entryCSN: 20051219223255Z#000003#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219223255Z

dn: cn=virusalert,dc=example,dc=com
objectClass: top
objectClass: kolabGroupOfNames
cn: virusalert
mail: virusalert@example.com
member: cn=user A,dc=example,dc=com
structuralObjectClass: kolabGroupOfNames
entryUUID: 24e4f29a-052b-102a-9743-bb3b1276c709
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219223255Z
entryCSN: 20051219223255Z#000004#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219223255Z

dn: cn=MAILER-DAEMON,dc=example,dc=com
objectClass: top
objectClass: kolabGroupOfNames
cn: MAILER-DAEMON
mail: MAILER-DAEMON@example.com
member: cn=user A,dc=example,dc=com
structuralObjectClass: kolabGroupOfNames
entryUUID: 24e674b2-052b-102a-9744-bb3b1276c709
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20051219223255Z
entryCSN: 20051219223255Z#000005#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20051219223255Z

dn: cn=shared1,dc=example,dc=com
objectClass: kolabSharedFolder
cn: shared1
acl: anyone all
kolabHomeServer: example.com
structuralObjectClass: kolabSharedFolder
entryUUID: 9a04a408-1566-102a-8220-d15b1307c8f1
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20060109141851Z
entryCSN: 20060109141851Z#000001#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20060109141851Z

dn: cn=user A,dc=example,dc=com
objectClass: top
objectClass: inetOrgPerson
objectClass: kolabInetOrgPerson
sn: A
cn: user A
givenName: user
userPassword:: e3NoYX1SNWhabkErQ0hNZXRMSkZhMit6WTB3aG1MeDQ9
mail: usera@example.com
uid: usera@example.com
kolabHomeServer: server.example.com
kolabInvitationPolicy: ACT_MANUAL
structuralObjectClass: inetOrgPerson
entryUUID: 5d3f844c-162f-102a-8225-d15b1307c8f1
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20060110141558Z
entryCSN: 20060110141558Z#000001#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20060110141558Z

dn: cn=user b,dc=example,dc=com
objectClass: top
objectClass: inetOrgPerson
objectClass: kolabInetOrgPerson
sn: b
cn: user b
givenName: user
userPassword:: e3NoYX1SNWhabkErQ0hNZXRMSkZhMit6WTB3aG1MeDQ9
mail: userb@example.com
uid: userb@example.com
kolabHomeServer: server.example.com
kolabInvitationPolicy: ACT_MANUAL
structuralObjectClass: inetOrgPerson
entryUUID: 6f6d7b42-162f-102a-8226-d15b1307c8f1
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20060110141628Z
entryCSN: 20060110141628Z#000001#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20060110141628Z

dn: cn=user c,dc=example,dc=com
objectClass: top
objectClass: inetOrgPerson
objectClass: kolabInetOrgPerson
sn: c
cn: user c
givenName: user
userPassword:: e3NoYX1SNWhabkErQ0hNZXRMSkZhMit6WTB3aG1MeDQ9
mail: userc@example.com
uid: userc@example.com
kolabHomeServer: server.example.com
kolabInvitationPolicy: ACT_MANUAL
structuralObjectClass: inetOrgPerson
entryUUID: 8569a614-162f-102a-8227-d15b1307c8f1
creatorsName: cn=manager,cn=internal,dc=example,dc=com
createTimestamp: 20060110141705Z
entryCSN: 20060110141705Z#000001#00#000000
modifiersName: cn=manager,cn=internal,dc=example,dc=com
modifyTimestamp: 20060110141705Z

