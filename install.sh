#!/bin/sh

MASTER_SITES=http://de.archive.ubuntu.com/ubuntu/


if ! [ -d  "ubuntu"  ]; then

           mkdir -p  ubuntu

       fi


if ! [ -d  "deb"  ]; then

           mkdir -p  deb

       fi

if ! [ -d  "tar"  ]; then

           mkdir -p  tar

       fi


                for BIN_DISTFILES in $(cat listpackages);do

                        if ! [ -f deb/$(echo  $BIN_DISTFILES | rev | sed -r 's/\/.+//' | rev) ]; then
         
                       cd  deb &&   fetch $MASTER_SITES$BIN_DISTFILES  && cd ../
 
                        fi 
                 done

   
                for DEB   in $(cat listpackages); do
                   
                    deb2targz deb/$(echo  $DEB | rev | sed -r 's/\/.+//' | rev)

                 done


                for TARGZ in $(cat listpackages);do  

                    tar xf deb/$(echo  $TARGZ  | rev | sed -r 's/\/.+//' | rev | sed s/.deb/.tar.*/) -C  ubuntu 

                 done


rm  -R         ubuntu/boot ubuntu/dev ubuntu/etc/fonts ubuntu/home   ubuntu/root ubuntu/tmp \
               ubuntu/var/log  ubuntu/var/tmp 

 

mkdir -p                                   ubuntu/var/run/shm
   


     if ! [ -f "tar/libflashsupport.so" ];then 

      cd tar && fetch ftp://ftp.tw.freebsd.org/pub/FreeBSD/FreeBSD/distfiles/flashplugin/9.0r31/libflashsupport.so && cd ../
   
      fi

 
cp       tar/libflashsupport.so            ubuntu/usr/lib
ln -s    libudev.so.1.3.5                  ubuntu/lib/i386-linux-gnu/libudev.so.0
ln -s    libcurl.so.4.3.0                  ubuntu/usr/lib/i386-linux-gnu/libcurl.so.5 
ln -s    bash                              ubuntu/bin/sh
cp -R    certs                             ubuntu/etc/ssl


cp /compat/linux/usr/lib/$(ls /compat/linux/usr/lib/ | grep libGL.so | head -2 | tail -n 1) ubuntu/usr/lib
cp /compat/linux/usr/lib/$(ls /compat/linux/usr/lib/ | grep libnvidia-glcore) ubuntu/usr/lib
cp /compat/linux/usr/lib/$(ls /compat/linux/usr/lib/ | grep libnvidia-tls) ubuntu/usr/lib

ln -s  $(ls /compat/linux/usr/lib/ | grep libGL.so | head -2 | tail -n 1)              ubuntu/usr/lib/libGL.so.1

 
       if ! [ -f "tar/linux-skype_oss_wrapper-0.1.1.txz" ]; then 

     cd tar && fetch http://pkg.freebsd.org/freebsd:11:x86:64/latest/All/linux-skype_oss_wrapper-0.1.1.txz && cd ../

        fi

         tar xf tar/linux-skype_oss_wrapper-0.1.1.txz  -C ubuntu/usr/lib    -s ",/.*/,,g" "*/libpulse.so.0"




sudo chroot ubuntu /usr/lib/i386-linux-gnu/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
 >  ubuntu/usr/lib/i386-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache

du -a /compat/ubuntu/usr/share/ca-certificates | sed 's/\/compat\/ubuntu\/usr\/share\/ca-certificates\///' |  awk '{print $2}' \
 >>  ubuntu/etc/ca-certificates.conf

sudo cp -R  ubuntu /compat
sudo chroot /compat/ubuntu locale-gen en_US.UTF-8
sudo chroot /compat/ubuntu locale-gen ru_RU.UTF-8
sudo chroot /compat/ubuntu /bin/dbus-uuidgen --ensure

sudo mkdir  /compat/ubuntu/tmp
sudo chroot /compat/ubuntu update-ca-certificates
sudo chroot /compat/ubuntu update-ca-certificates

