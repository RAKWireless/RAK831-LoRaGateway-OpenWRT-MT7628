#!/bin/ash

AP_INTERFACE=ra0
STA_INTERFACE=apcli0
wifi_option=`uci show /etc/config/wireless.radio0.linkit_mode | awk -F '=' '{print $2}'`
net_gw=`route | grep "default" | awk '{print $2}'`
ap_gw=`ifconfig br-lan | grep "inet addr" | awk '{print $2}' | awk -F ':' '{print $2}'`
phy_option=`swconfig dev rt305x port 0 show | grep "link" | awk '{print $3}' | awk -F ':' '{print $2}'`

AP_WIFISTATUS_CONF=/tmp/ap_wifistatus.conf
STA_WIFISTATUS_CONF=/tmp/sta_wifistatus.conf

if [ $wifi_option == \'sta\' ]
then
	
	iwinfo $STA_INTERFACE info > $STA_WIFISTATUS_CONF
	ifconfig $STA_INTERFACE | grep "inet addr" | awk '{print $2}' >> $STA_WIFISTATUS_CONF
	ifconfig $STA_INTERFACE | grep "inet addr" | awk '{print $3}' >> $STA_WIFISTATUS_CONF
	ifconfig $STA_INTERFACE | grep "inet addr" | awk '{print $4}' >> $STA_WIFISTATUS_CONF
	echo "gateway:"$net_gw >> $STA_WIFISTATUS_CONF

elif [ $wifi_option == \'ap\' ]
then
	if [ $phy_option == "down" ]
	then
		iwinfo $AP_INTERFACE info > $AP_WIFISTATUS_CONF
		ifconfig br-lan | grep "inet addr" | awk '{print $2}' >> $AP_WIFISTATUS_CONF
		ifconfig br-lan | grep "inet addr" | awk '{print $3}' >> $AP_WIFISTATUS_CONF
		ifconfig br-lan | grep "inet addr" | awk '{print $4}' >> $AP_WIFISTATUS_CONF
		echo "gateway:"$ap_gw >> $AP_WIFISTATUS_CONF

	elif [ $phy_option == "up" ]
	then
		iwinfo $AP_INTERFACE info > $AP_WIFISTATUS_CONF
		ifconfig eth0.2 | grep "inet addr" | awk '{print $2}' >> $AP_WIFISTATUS_CONF
		ifconfig eth0.2 | grep "inet addr" | awk '{print $3}' >> $AP_WIFISTATUS_CONF
		ifconfig eth0.2 | grep "inet addr" | awk '{print $4}' >> $AP_WIFISTATUS_CONF
		echo "gateway:"$net_gw >> $AP_WIFISTATUS_CONF
	fi
else
	echo "wifi_option failed!!!"
fi


exit 0
