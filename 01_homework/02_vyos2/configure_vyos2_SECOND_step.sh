#!/bin/vbash
# Scripts need to be executed as vyos user, not root!
# https://docs.vyos.io/en/equuleus/automation/command-scripting.html

source /opt/vyatta/etc/functions/script-template
configure

# Tunnelsetup of VyOS2 VM
set interfaces tunnel tun66 address '172.16.10.2/24'
set interfaces tunnel tun66 encapsulation 'gre'
set interfaces tunnel tun66 ip adjust-mss 'clamp-mss-to-pmtu'
set interfaces tunnel tun66 multicast 'enable'
set interfaces tunnel tun66 parameters ip key '1'
set interfaces tunnel tun66 source-address '10.22.10.2'
set interfaces tunnel tun66 source-interface 'eth0'
set protocols nhrp tunnel tun66 cisco-authentication 'qwerty123'
set protocols nhrp tunnel tun66 map 172.16.10.1/24 nbma-address '10.22.10.1'
set protocols nhrp tunnel tun66 map 172.16.10.1/24 register
set protocols nhrp tunnel tun66 multicast 'nhs'
set protocols nhrp tunnel tun66 redirect
set protocols nhrp tunnel tun66 shortcut
set system time-zone 'Europe/Moscow'
set vpn ipsec esp-group esp_s1 compression 'disable'
set vpn ipsec esp-group esp_s1 lifetime '1800'
set vpn ipsec esp-group esp_s1 mode 'transport'
set vpn ipsec esp-group esp_s1 pfs 'dh-group2'
set vpn ipsec esp-group esp_s1 proposal 1 encryption 'aes256'
set vpn ipsec esp-group esp_s1 proposal 1 hash 'sha1'
set vpn ipsec esp-group esp_s1 proposal 2 encryption '3des'
set vpn ipsec esp-group esp_s1 proposal 2 hash 'md5'
set vpn ipsec ike-group ike_s1 close-action 'none'
set vpn ipsec ike-group ike_s1 ikev2-reauth 'no'
set vpn ipsec ike-group ike_s1 key-exchange 'ikev1'
set vpn ipsec ike-group ike_s1 lifetime '3600'
set vpn ipsec ike-group ike_s1 proposal 1 dh-group '2'
set vpn ipsec ike-group ike_s1 proposal 1 encryption 'aes256'
set vpn ipsec ike-group ike_s1 proposal 1 hash 'sha1'
set vpn ipsec ike-group ike_s1 proposal 2 dh-group '2'
set vpn ipsec ike-group ike_s1 proposal 2 encryption 'aes128'
set vpn ipsec ike-group ike_s1 proposal 2 hash 'sha1'
set vpn ipsec interface 'eth0'
set vpn ipsec profile dm66 authentication mode 'pre-shared-secret'
set vpn ipsec profile dm66 authentication pre-shared-secret 'qwerty123'
set vpn ipsec profile dm66 bind tunnel 'tun66'
set vpn ipsec profile dm66 esp-group 'esp_s1'
set vpn ipsec profile dm66 ike-group 'ike_s1'

commit

# loaded ike secret ‘ike-dmvpn-tun66’
loaded ike secret 'ike-dmvpn-tun66'
save

# Continue
set protocols ospf area 0
set protocols ospf interface tun66 area '0'
set protocols ospf interface tun66 priority '0'

commit
save

# Checking results
run show ip ospf database

exit