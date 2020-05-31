#!/bin/bash
wget http://download.virtualbox.org/virtualbox/6.1.6/VBoxGuestAdditions_6.1.6.iso
mkdir /media/VBoxGuestAdditions
mount -o loop,ro VBoxGuestAdditions_6.1.6.iso /media/VBoxGuestAdditions
sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_6.1.6.iso
umount /media/VBoxGuestAdditions
rmdir /media/VBoxGuestAdditions
