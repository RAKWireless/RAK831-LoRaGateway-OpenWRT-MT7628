#!/bin/sh

# This script is intended to be used on IoT Starter Kit platform, it performs
# the following actions:
#       - export/unpexort GPIO11 used to reset the SX1301 chip
#		- GPIO11 in the wisap board is GPIO0， so you need connect RAK831 RAT pin to wisap GPIO0
#		  and execute ./reset_lgw.sh start 11 to reset RAK831
#
# Usage examples:
#       ./reset_lgw.sh stop 11
#       ./reset_lgw.sh start 11

# The reset pin of SX1301 is wired with RPi GPIO11
# If used on another platform, the GPIO number can be given as parameter.
if [ -z "$2" ]; then 
    IOT_SK_SX1301_RESET_PIN=11
else
    IOT_SK_SX1301_RESET_PIN=$2
fi

echo "Accessing concentrator reset pin through GPIO$IOT_SK_SX1301_RESET_PIN..."

WAIT_GPIO() {
    sleep 1
}

iot_sk_init() {
    # setup GPIO 11
    echo "$IOT_SK_SX1301_RESET_PIN" > /sys/class/gpio/export; WAIT_GPIO

    # set GPIO 11 as output
    echo "out" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/direction; WAIT_GPIO

    # write output for SX1301 reset
    echo "1" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/value; WAIT_GPIO
    echo "0" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/value; WAIT_GPIO

    # set GPIO 11 as input
    echo "in" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/direction; WAIT_GPIO
}

iot_sk_term() {
    # cleanup GPIO 11
    if [ -d /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN ]
    then
        echo "$IOT_SK_SX1301_RESET_PIN" > /sys/class/gpio/unexport; WAIT_GPIO
    fi
}

case "$1" in
    start)
    iot_sk_term
    iot_sk_init
    ;;
    stop)
    iot_sk_term
    ;;
    *)
    echo "Usage: $0 {start|stop} [<gpio number>]"
    exit 1
    ;;
esac

exit 0
