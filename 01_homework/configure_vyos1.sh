#!/bin/vbash
# Scripts need to be executed as vyos user, not root!
# https://docs.vyos.io/en/equuleus/automation/command-scripting.html

source /opt/vyatta/etc/functions/script-template
configure

# Operational mode
run show interfaces

# Main setup of VyOS1 VM
set interfaces ethernet eth0 description ‘net:Internet’
set interfaces ethernet eth0 address 10.100.10.5/26
set interfaces ethernet eth1 description ‘net:DmVPN’
set interfaces ethernet eth1 address 10.22.10.1/29
set service ssh
set protocols static route 0.0.0.0/0 next-hop 10.100.10.1 distance 1
set system host-name v-hub
set system name-server 8.8.8.8
set system name-server 8.8.4.4

# Exiting script
commit
save

# List of previous commands
run show configuration commands

exit