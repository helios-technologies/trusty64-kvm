## Created on 2016/06/02

require 'ostruct'
image = OpenStruct.new
image.name = 'trusty64'
image.disk = '/dev/nbd0'
image.size = '8G'
image.mnt  = '/vagrant/mnt'

execute("apt-get install -y qemu-utils")
execute("apt-get install -y debootstrap")

execute("qemu-img create -f qcow2 #{image.name}.qcow2 #{image.size}")

template('opt/kaigara/bin/mount-image.sh')
template('opt/kaigara/bin/chroot-setup.sh')
execute('chmod u+x /opt/kaigara/bin/mount-image.sh')
execute('chmod u+x /opt/kaigara/bin/chroot-setup.sh')

execute('/opt/kaigara/bin/mount-image.sh')
execute("cp /opt/kaigara/bin/chroot-setup.sh #{image.mnt}/root")
execute("chroot #{image.mnt} /root/chroot-setup.sh")
