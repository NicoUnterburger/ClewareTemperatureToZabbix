#!/bin/bash
# Script for Monitoring a Cleware Temperature-Sensor with Zabbix
# created 2023-06-05 by github.com/NicoUnterburger

temp=$(/etc/cleware/USBtemp -b)
temp2=${temp::-2}
echo $temp2
exit 0
