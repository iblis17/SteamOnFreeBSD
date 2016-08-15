 FreeBSD 11.0
 
 You need to have a recent nvidia-driver with LINUX compatibality support or an AMD graphics card that is supported by FreeBSD. See [FreeBSD Wiki](https://wiki.freebsd.org/Graphics) for further information. 
 
 nvidia-driver or  xf86-video-ati
 
 Dependencies:
 
 1) pkg install deb2targz
  
 2) pkg install rpm2cpio
 
 3) pkg install doas 
 
 create /usr/local/etc/doas.conf :
 
 permit nopass keepenv yourusername 
 
 
 
 download: fetch  http://media.steampowered.com/client/installer/steam.deb 
 
 deb2targz steam.deb
 
 Extract steam.tar.gz as root:  tar -zxvf steam.tar.gz -C /

 steam
 
 ./install.sh
 
 ./steamrun

for amd64 first run install.sh then run install_x86_64.sh 
also in script steamrun change variable ubuntu on ubuntu_x86_64

![alt tag](https://raw.githubusercontent.com/SteamOnFreeBSD/Steam/master/2016-03-15-171059_1366x768_scrot.png)
![alt tag](https://raw.githubusercontent.com/SteamOnFreeBSD/Steam/master/2016-04-03-030913_1366x768_scrot.png)
