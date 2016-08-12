 FreeBSD 11.0
 
 You need to have a recent nvidia-driver with LINUX compatibality support or an AMD graphics card that is supported by FreeBSD. See [FreeBSD Wiki](https://wiki.freebsd.org/Graphics) for further information. 
 
 
 pkg install deb2targz
  
 pkg install rpm2cpio
 
 pkg install doas 
 
 create /usr/local/etc/doas.conf :
 
 permit nopass keepenv yourusername 
 
 
 
 Extract steam.tar.gz as root: tar -zxvf steam.tar.gz  -C /
 
 steam

./install.sh
 
 ./steamrun



![alt tag](https://raw.githubusercontent.com/SteamOnFreeBSD/Steam/master/2016-03-15-171059_1366x768_scrot.png)
![alt tag](https://raw.githubusercontent.com/SteamOnFreeBSD/Steam/master/2016-04-03-030913_1366x768_scrot.png)
