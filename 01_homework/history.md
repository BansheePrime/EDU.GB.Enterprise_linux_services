## Homework 01 step by step
### Main tool: **virt-manager** https://virt-manager.org/
In Preferences allow XML editing.

        1. Create network based on vm-net.xml
                - switch off "Autostart On Boot" in **default** network details

        2. Resolve tftp "no directory" error
                - vm-net looking for tftp folder on host (!)
                        --$ sudo mkdir /srv/tftp/
                        --$ sudo chmod 755 /srv/tftp && ls -lA /srv

        3. Create network based on vm-int.xml
                - vm-net may conflict with default network because of 'bridge name="virbr0" stp="on" delay="0"/>'
                        -- switch bridge of default network to "virbr1" <bridge name="virbr1" stp="on" delay="0"/>
        
        4. VM's setting up following DmVPN.pdf
                - add VyOS image file to "/var/lib/libvirt/images" or use "Browse local" to downloaded file

## Archive
gem fetch vagrant-vyos
gem install vagrant-vyos

error: failed to get mtu of bridge `virbr0': No such device (Libvirt::Error)

virsh # net-list --all --inactive

virsh # net-define /home/gidra/Public/EDU.GB.Enterprise_linux_services/01_homework/vm-net.xml
virsh # net-autostart vm-net


        <!-- changing tftp folder. Default was: <tftp root="/srv/tftp"/> -->
        <tftp root="/var/lib/tftpboot"/>

   30  sudo cp /usr/lib/systemd/system/tftp.service /usr/lib/systemd/system/tftp.service.bak
   31  ls /usr/lib/systemd/system/tf*
   32  sudo vim /usr/lib/systemd/system/tftp.service 
   33  sudo systemctl restart tftp.service 
   34  sudo systemctl daemon-reload 