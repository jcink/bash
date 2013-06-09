#!/bin/sh

# Make a fake/container filesystem

dd if=/dev/zero of=filesystem.img bs=1M count=40000 # 40GB fs
mke2fs cachefilesystem.img # mke2fs

# Mount it with a loopback:

sudo mount -o loop /home/jcink/filesystem.img /var/www/cached/cache # loopback mount
chmod 755 /var/www/cached/cache

