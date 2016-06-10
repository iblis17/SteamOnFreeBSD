#!/bin/sh

MASTER_SITES=http://de.archive.ubuntu.com/ubuntu/
mkdir ubuntu
mkdir deb
 

                for BIN_DISTFILES in $( cat listpackages );do

                        if ! [ -f deb/$(echo  $BIN_DISTFILES | rev | sed -r 's/\/.+//' | rev) ]; then
         
                       cd  deb &&   fetch $MASTER_SITES$BIN_DISTFILES  && cd ../
 
                        fi 
                 done

   
                for DEB   in $(ls deb | grep deb); do
                   
                    deb2targz deb/$DEB

                 done


                for TARGZ in $(ls deb  | grep tar );do  

                    tar xf deb/$TARGZ -C  ubuntu 

                 done


rm  -R         ubuntu/boot ubuntu/dev ubuntu/etc/fonts ubuntu/home   ubuntu/root ubuntu/tmp \
               ubuntu/var/log  ubuntu/var/tmp 

 

mkdir -p                                   ubuntu/var/run/shm


cp       libflashsupport.so                ubuntu/usr/lib


ln -s    libudev.so.1.3.5                  ubuntu/lib/i386-linux-gnu/libudev.so.0
ln -s    libcurl.so.4.3.0                  ubuntu/usr/lib/i386-linux-gnu/libcurl.so.5 
ln -s    bash   ubuntu/bin/sh

cp /compat/linux/usr/lib/$(ls /compat/linux/usr/lib/ | grep libGL.so | head -2 | tail -n 1) ubuntu/usr/lib
cp /compat/linux/usr/lib/$(ls /compat/linux/usr/lib/ | grep libnvidia-glcore) ubuntu/usr/lib
cp /compat/linux/usr/lib/$(ls /compat/linux/usr/lib/ | grep libnvidia-tls) ubuntu/usr/lib

ln -s  $(ls /compat/linux/usr/lib/ | grep libGL.so | head -2 | tail -n 1)              ubuntu/usr/lib/libGL.so.1

fetch http://pkg.freebsd.org/freebsd:11:x86:64/latest/All/linux-skype_oss_wrapper-0.1.1.txz
tar xf linux-skype_oss_wrapper-0.1.1.txz  -C ubuntu/usr/lib    -s ",/.*/,,g" "*/libpulse.so.0"
 
sudo chroot ubuntu /usr/lib/i386-linux-gnu/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
 >  ubuntu/usr/lib/i386-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache

sudo cp -R ubuntu /compat
sudo chroot /compat/ubuntu locale-gen en_US.UTF-8
sudo chroot /compat/ubuntu locale-gen ru_RU.UTF-8
sudo chroot /compat/ubuntu /bin/dbus-uuidgen --ensure

