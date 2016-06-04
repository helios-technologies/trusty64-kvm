#!/bin/bash

export VM_NAME=bootmaster
export VM_DISK=/var/lib/libvirt/images/$VM_NAME.qcow2
export VM_MEM=1024
export VM_BR=br0

if [ $(virsh list --all --name | grep "^$VM_NAME$") ]; then
  virsh destroy $VM_NAME
  virsh undefine $VM_NAME
fi

virt-install \
  --connect=qemu:///system \
  --name=$VM_NAME \
  --ram=$VM_MEM \
  --vcpus=2 \
  --import \
  --os-type linux \
  --os-variant 'ubuntu14.04' \
  --boot=hd \
  --disk=$VM_DISK \
  --graphics vnc \
  --noautoconsole

#  --network bridge=$VM_BR \
