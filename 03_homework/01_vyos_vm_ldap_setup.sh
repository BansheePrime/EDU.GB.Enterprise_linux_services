#!/bin/vbash
# Scripts need to be executed as vyos user, not root!
# https://docs.vyos.io/en/equuleus/automation/command-scripting.html

source /opt/vyatta/etc/functions/script-template
configure

set nat destination rule 5 source address 0.0.0.0/0
set nat destination rule 5 destination address 10.100.10.4
set nat destination rule 5 destination port 389
set nat destination rule 5 inbound-interface eth0
set nat destination rule 5 translation address 172.16.0.11
set nat destination rule 5 translation port 389
set nat destination rule 5 protocol tcp_udp

# Saving settings
commit
save

# # List of previous commands

exit