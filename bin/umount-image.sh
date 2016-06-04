#!/bin/bash

set -xe

dest=/vagrant/mnt
disk=/dev/nbd0

umount $dest/dev/pts 
umount $dest/dev
umount $dest/proc
umount $dest/sys
umount $dest/boot
umount $dest

qemu-nbd -d $disk
