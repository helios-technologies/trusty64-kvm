# trusty64-kvm
sysops installing a ubuntu kvm image from scratch

## Usage
```
vagrant up
vagrant ssh
gem install kaigara

sudo su -
cd /vagrant
kaish sysops exec
```

#FIXME
then ./bin/mount-image.sh

chroot /vagrant/mnt

edit /boot/grub/grub.cfg

replace nbd0p3 by vda3
