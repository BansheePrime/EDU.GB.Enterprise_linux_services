#!/bin/vbash
# Scripts need to be executed as vyos user, not root!
# https://docs.vyos.io/en/equuleus/automation/command-scripting.html

source /opt/vyatta/etc/functions/script-template
configure

# Main setup of VyOS2 VM
set interfaces ethernet eth0 description 'net:DmVPN'
set interfaces ethernet eth0 address 10.22.10.2/29
set system host-name v-sp1
set service ssh

# Exiting script
commit
save

exit