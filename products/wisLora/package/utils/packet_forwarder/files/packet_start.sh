#!/bin/sh


IOT_SK_SX1301_RESET_PIN=11

echo "Accessing concentrator reset pin through GPIO$IOT_SK_SX1301_RESET_PIN..."

WAIT_GPIO() {
    sleep 1
}

# cleanup GPIO 11

if [ -d /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN ]
then
echo "$IOT_SK_SX1301_RESET_PIN" > /sys/class/gpio/unexport; WAIT_GPIO
fi

# setup GPIO 11
echo "$IOT_SK_SX1301_RESET_PIN" > /sys/class/gpio/export; WAIT_GPIO

# set GPIO 11 as output
echo "out" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/direction; WAIT_GPIO

# write output for SX1301 reset
echo "1" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/value; WAIT_GPIO
echo "0" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/value; WAIT_GPIO

# set GPIO 11 as input
echo "in" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/direction; WAIT_GPIO

cd /usr/bin/packet_forwarder
touch /usr/bin/packet_forwarder/log

CheckProcess()
{

  PROCESS_NUM=`ps | grep "$1" | grep -v "grep" | wc -l` 

  if [ $PROCESS_NUM -eq 1 ];
  then
    return 0
  else
    return 1
  fi
}

while [ 1 ] ; do
  CheckProcess "lora_pkt_fwd"
  CheckQQ_RET=$?

  if [ $CheckQQ_RET -eq 1 ];
  then
    killall -9 lora_pkt_fwd
     ./lora_pkt_fwd > /usr/bin/packet_forwarder/log 
  fi
  
  sleep 1
done

