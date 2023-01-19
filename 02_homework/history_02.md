/var/lib/libvirt/images/VyOS.qcow2

sudo apt-get install libguestfs-tools

sudo guestmount -a /var/lib/libvirt/images/VyOS.qcow2 -m /dev/sda1 /mnt

sudo guestunmount /mnt

└─sda1   8:1    0     2G  0 part /usr/lib/live/mount/persistence

/usr/lib/live/mount/persistence/lost+found/test.tmp

Создадим ВМ AAA cо следующими параметрами:
- ОС Ubuntu 20.04 (Debian 10);
- оперативная память 1 ГБ, количество процессоров 2;
- диск 8 ГБ (диск разбить на следующие разделы: part1 - 1M, ef02, grub;
part2 - 512M, 8200, swap; part3 - все остальное пространство, 8300, root);
- сетевой адаптер NIC1 (vm-int, изолированная).
Последовательность действий и параметров при создании и установке
операционной системы ВМ ААА такая же, за исключением:
- название тома хранилища – aaa.qcow2;
- название ВМ – ААА;
- при загрузке по сети, используем сетевой адаптер vm-net (внешняя), после
установки ОС меняем на vm-int (изолированная);
- имя компьютера – aaa.

dig @10.100.10.10 a dns01.example.int
dig @172.16.0.10 a dns01.example.int

dig @172.16.0.10 a soa example.net
dig @10.100.10.10 a soa example.int << - wrong! Тут тоже должна быть А запись / Только с другим IP / У тебя не отвечает внешний интерфейс / С внутренним все в порядке
