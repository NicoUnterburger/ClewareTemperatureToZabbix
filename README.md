# ClewareTemperatureToZabbix
ClewareTemperatureToZabbix - uses USB temperature sensors from the company Cleware and sends the data to a Zabbix server

Script was tested on Debian 11 with Zabbix 6.0 and the following sensor: 
```
https://www.cleware-shop.de/epages/63698188.sf/en_US/?ObjectPath=/Shops/63698188/Products/4
```

## Installation guide
1. Install Linux dependencies
```
apt install wget curl zabbix-agent unzip libusb-dev
```
2. Download original Linux scripts from Cleware
```
mkdir /etc/cleware
cd /etc/cleware/
wget http://www.cleware.info/downloads/german/Linux_Ubuntu_6.6.1.zip
unzip Linux_Ubuntu_6.6.1.zip
chmod +x /etc/cleware/USBtemp
```
3. Save Wrapper-Script to local Folder (/etc/zabbix/scripts/cleware-wrapper.sh)
```
mkdir /etc/zabbix/scripts/
wget https://raw.githubusercontent.com/NicoUnterburger/ClewareTemperatureToZabbix/main/cleware-wrapper.sh
chmod +x /etc/zabbix/scripts/cleware-wrapper.sh
```
4. Edit zabbix-agent.conf and add UserParameter
```
UserParameter=cleware-wrapper.sh[*],sudo /etc/zabbix/scripts/cleware-wrapper.sh $1
```
5. Add following line to /etc/sudoers
```
zabbix ALL=(ALL:ALL) NOPASSWD: /etc/zabbix/scripts/cleware-wrapper.sh
```
6. Reboot agent client
7. Import Zabbix Template and link to host

![zabbix-cleware-graph](https://github.com/NicoUnterburger/ClewareTemperatureToZabbix/assets/5436763/d515b0d4-1e1e-4541-b824-91cf11f2f2d0)
