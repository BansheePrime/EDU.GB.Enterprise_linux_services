#!/bin/vbash
# Scripts need to be executed as vyos user, not root!
# https://docs.vyos.io/en/equuleus/automation/command-scripting.html

source /opt/vyatta/etc/functions/script-template
configure

# Tunnel setup of VyOS1 VM
set interfaces tunnel tun66 address '172.16.10.1/24'
set interfaces tunnel tun66 encapsulation 'gre'
set interfaces tunnel tun66 multicast 'enable'
set interfaces tunnel tun66 parameters ip key '1'
set interfaces tunnel tun66 source-address '10.22.10.1'
set interfaces tunnel tun66 source-interface 'eth1'
set protocols nhrp tunnel tun66 cisco-authentication 'qwerty123'
set protocols nhrp tunnel tun66 holding-time '300'
set protocols nhrp tunnel tun66 multicast 'dynamic'
set protocols nhrp tunnel tun66 redirect
set protocols nhrp tunnel tun66 shortcut
set system time-zone 'Europe/Moscow'
set vpn ipsec esp-group esp_h1 compression 'disable'
set vpn ipsec esp-group esp_h1 lifetime '1800'
set vpn ipsec esp-group esp_h1 mode 'transport'
set vpn ipsec esp-group esp_h1 pfs 'dh-group2'
set vpn ipsec esp-group esp_h1 proposal 1 encryption 'aes256'
set vpn ipsec esp-group esp_h1 proposal 1 hash 'sha1'
set vpn ipsec esp-group esp_h1 proposal 2 encryption '3des'
set vpn ipsec esp-group esp_h1 proposal 2 hash 'md5'
set vpn ipsec ike-group ike_h1 ikev2-reauth 'no'
set vpn ipsec ike-group ike_h1 key-exchange 'ikev1'
set vpn ipsec ike-group ike_h1 lifetime '3600'
set vpn ipsec ike-group ike_h1 proposal 1 dh-group '2'
set vpn ipsec ike-group ike_h1 proposal 1 encryption 'aes256'
set vpn ipsec ike-group ike_h1 proposal 1 hash 'sha1'
set vpn ipsec ike-group ike_h1 proposal 2 dh-group '2'
set vpn ipsec ike-group ike_h1 proposal 2 encryption 'aes128'
set vpn ipsec ike-group ike_h1 proposal 2 hash 'sha1'
set vpn ipsec interface 'eth1'
set vpn ipsec profile dm66 authentication mode 'pre-shared-secret'
set vpn ipsec profile dm66 authentication pre-shared-secret 'qwerty123'
set vpn ipsec profile dm66 bind tunnel 'tun66'
set vpn ipsec profile dm66 esp-group 'esp_h1'
set vpn ipsec profile dm66 ike-group 'ike_h1'

commit
save

# Continue
set protocols ospf area 0
set protocols ospf interface tun66 priority '255'
set protocols ospf interface tun66 area '0'

commit
save

# Checking results
run show ip ospf database

exit