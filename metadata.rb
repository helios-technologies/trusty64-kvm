require 'ostruct'

image = OpenStruct.new
image.name = 'trusty64'
image.disk = '/dev/nbd0'
image.size = '8G'
image.mnt  = '/vagrant/mnt'
