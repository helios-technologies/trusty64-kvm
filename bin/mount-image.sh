#!/bin/bash

set -xe

disk=/dev/nbd0
dest=/vagrant/mnt
FILE="$1"

if [ -z "$FILE" ]; then
  echo "Usage: mount-image.sh FILENAME" 1>&2
  exit 1
fi

modprobe nbd max_part=8
qemu-nbd -c $disk "$FILE"

sleep 4

mount ${disk}p3 $dest
mount ${disk}p1 $dest/boot

mount --bind /dev $dest/dev
mount --bind /dev/pts $dest/dev/pts
mount -t proc proc $dest/proc
mount -t sysfs sys $dest/sys

echo "System ready for chroot"
