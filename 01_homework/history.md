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