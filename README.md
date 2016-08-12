 FreeBSD 11.0
 
 nvidia-driver or  xf86-video-ati
 
 
 pkg install deb2targz
  
 pkg install rpm2cpio
 
 pkg install doas 
 
 create /usr/local/etc/doas.conf :
 
 permit nopass keepenv yourusername 
 
 
 
 doas tar -zxvf steam.tar.gz  -C /
 
 steam

./install.sh
 
 ./steamrun



![alt tag](https://raw.githubusercontent.com/SteamOnFreeBSD/Steam/master/2016-03-15-171059_1366x768_scrot.png)
![alt tag](https://raw.githubusercontent.com/SteamOnFreeBSD/Steam/master/2016-04-03-030913_1366x768_scrot.png)
