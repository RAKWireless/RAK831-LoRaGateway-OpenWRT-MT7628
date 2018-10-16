#!/bin/sh
#cd /usr/bin
# get wisap firmware version
WC_VER=`cat /etc/wiskey/version`

NABTO_CONFIG_FILE=/etc/wiskey/nabtonat.conf
# set wireless configurtion file path
WIRELESS_CONF=/etc/config/wireless
NET_IF=ra0

# set wisap firmware version
[ -z "$WC_VER" ] && WC_VER=ENG.WA.02.03

uci set system.@system[0].firmware_version=${WC_VER}
uci commit system
#
# set Nabto ID
if [ -f $NABTO_CONFIG_FILE ]; then
NABTO_UUID=`awk '{if ($1=="nabto_id") {print $2}}' $NABTO_CONFIG_FILE`
NABTO_KEY=`awk '{if ($1=="nabto_key") {print $2}}' $NABTO_CONFIG_FILE`
fi

SetNatP2p()
{
	if [ -f "/sys/class/net/$NET_IF/address" ]; then
		HWaddr=`cat "/sys/class/net/$NET_IF/address" | awk -F: '{print $4 $5 $6}' | awk '{print $1}'`
	
	else
		return 1
	
	fi
	if [ ! -f $NABTO_CONFIG_FILE ]; then
		NABTO_UUID=wisap.$HWaddr.p2p.rakwireless.com
		echo "nabto_id $NABTO_UUID" > $NABTO_CONFIG_FILE
		echo "nabto_key $NABTO_KEY" >> $NABTO_CONFIG_FILE
	fi
	sync
	IsProcRun=`ps | grep "unabto_tunnel" | grep -v "grep" | sed -n '1P' | awk '{print $1}'`
	if [ "$IsProcRun" != "" ]; then kill $IsProcRun; fi	#kill ID
	if [ -f $NABTO_CONFIG_FILE ]; then
		if [ "$NABTO_KEY" == "" ]; then
			unabto_tunnel -d $NABTO_UUID -s > /dev/console 2>&1 &

		else
			unabto_tunnel -d $NABTO_UUID -k $NABTO_KEY -s > /dev/console 2>&1 &
		fi
	else
		echo "Can't find $NABTO_CONFIG_FILE" > /dev/console 2>&1
	fi

	return 0

}	#SetNatP2p

# we must get current network option when user switch from AP mode to station mode.
netif=`uci get $WIRELESS_CONF.sta.network`
# we must sure the network option is set 'wan0'                          
if [ $netif = "wan" ]; then                 
    uci set $WIRELESS_CONF.sta.network=wan0                 
    uci commit                                                  
fi

gpio_ctrl > /dev/console 2>&1 &

sleep 1

luci_service -p 9999 > /dev/console 2>&1 &

cd /mnt

while [ 1 ] 
do 
	lo_status=`ifconfig lo | grep "UP"`
	ra0_status=`ifconfig ra0 | grep "UP"`
	if [ "$lo_status" != "" ] && [ "$ra0_status" != "" ]
	then
		echo $lo_status > /dev/console 2>&1
		SetNatP2p
		if [ $? == 0 ]; then break; fi
	fi
	sleep 1
done

