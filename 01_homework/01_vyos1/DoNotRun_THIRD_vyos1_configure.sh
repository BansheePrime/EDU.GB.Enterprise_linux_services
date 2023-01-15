#!/bin/vbash
# Scripts need to be executed as vyos user, not root!
# https://docs.vyos.io/en/equuleus/automation/command-scripting.html

source /opt/vyatta/etc/functions/script-template
configure

# OSPF setup of VyOS1 VM
set protocols ospf area 0
set protocols ospf interface tun66 priority '255'
set protocols ospf interface tun66 area '0'

commit
save

# Checking results
run show ip ospf database

exit