#!/bin/vbash
# Scripts need to be executed as vyos user, not root!
# https://docs.vyos.io/en/equuleus/automation/command-scripting.html

source /opt/vyatta/etc/functions/script-template
configure

# # Operational mode
# run show interfaces

# Main setup of VyOS VM
set service ssh

set interfaces ethernet eth0 address 10.100.10.4/26
set interfaces ethernet eth0 description 'net:Internet'
set interfaces ethernet eth1 address 172.16.0.1/24
set interfaces ethernet eth1 description 'net:Homework'

# Saving settings
commit
save

set nat source rule 5 destination address !172.16.0.0/24
set nat source rule 5 source address 172.16.0.0/24
set nat source rule 5 outbound-interface any
set nat source rule 5 translation address 10.100.10.4

# Saving settings
commit
save

show nat

# # List of previous commands
# run show configuration commands

exit