ClewareTemperatureToZabbix - uses USB temperature sensors from the company Cleware and sends the data to a Zabbix server

Script was tested on Debian 11 with Zabbix 6.0 and the following sensor: 
https://www.cleware-shop.de/epages/63698188.sf/en_US/?ObjectPath=/Shops/63698188/Products/4

# Installation guide
1. Install Linux dependencies
	   apt install wget curl zabbix-agent unzip
2. Download original Linux scripts from Cleware
```
	   mkdir /etc/cleware
	   cd /etc/cleware/
	   wget http://www.cleware.info/downloads/german/Linux_Ubuntu_6.6.1.zip
	   unzip Linux_Ubuntu_6.6.1.zip
```
3. Save Wrapper-Script to local Folder (/etc/zabbix/scripts/cleware-wrapper.sh)
	   mkdir /etc/zabbix/scripts/
	   wget https://raw.githubusercontent.com/NicoUnterburger/ClewareTemperatureToZabbix/main/cleware-wrapper.sh
4. Edit zabbix-agent.conf and add UserParameter
	   UserParameter=cleware-wrapper.sh[*],sudo /etc/zabbix/scripts/cleware-wrapper.sh $1
5. Add following line to /etc/sudoers
	   zabbix ALL=(ALL:ALL) NOPASSWD: /etc/zabbix/scripts/cleware-wrapper.sh
6. Import Zabbix Template and link to host
