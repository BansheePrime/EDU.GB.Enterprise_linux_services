

check in netplan config applied to existing correct interface in my case it was enp4s0 on AAA vm.


ldap admin password on AAA vm: "tech"
{SSHA}berMqnBQfyxeuA2PI7CIP5Qr1Dbhh7Rx

{SSHA}jD2hO2e1c0yE9/LK115PMC/zV/w9aNLy


root@aaa:~/aaa/ldiff# ldapadd -Y EXTERNAL -H ldapi:/// -f 0003_cn_config_backend_init.ldif
SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
adding new entry "cn=module,cn=config"
ldap_add: Other (e.g., implementation specific) error (80)
	additional info: <olcModuleLoad> handler exited with 1


root@aaa:~/aaa/ldiff# ls /usr/lib/ldap/back_h*
/usr/lib/ldap/back_hdb-2.4.so.2        /usr/lib/ldap/back_hdb.la
/usr/lib/ldap/back_hdb-2.4.so.2.10.12  /usr/lib/ldap/back_hdb.so


root@aaa:~/aaa/ldiff# ping aaa.example.int
PING aaa.example.int (172.16.0.11) 56(84) bytes of data.
64 bytes from aaa (172.16.0.11): icmp_seq=1 ttl=64 time=0.077 ms
64 bytes from aaa (172.16.0.11): icmp_seq=2 ttl=64 time=0.025 ms

See backend setup lecture video 33:56

root@aaa:~/aaa/ldiff# ldapmodify -Y EXTERNAL -H ldapi:/// -D 'cn=config' -f 0004_cn_config_dbindex_modify.ldif
SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
modifying entry "olcDatabase={1}hdb,cn=config"
ldap_modify: No such object (32)
	matched DN: cn=config


l.: exp
p.: exp


ldapsearch timemark 55:46


apt install libpam-ldapd libnss-ldap


