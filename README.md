# Welcome to the WisLora wiki!
The WisLora is WisAp(Mt7628 + OpenWRT) and Lora gateway, here to use RAK831. It is based on the latest SX1301 driver lora_gateway v5.0.1 and semtech packet_forwarder v4.0.1. We've tested it with TTN.

## OverView
WisAp:
<div align=center> <img src="https://github.com/RAKWireless/wiscore/raw/master/img/wisap_overview.png" /> </div>
RAK831:
<div align=center> <img src="https://github.com/RAKWireless/wiscore/raw/master/img/RAK831.png" /> </div>
Here the RAK831 is Lora Gateway

## Connect RAK831 To WisAp

	RAK831 		WisAp
	  
	  5V    <===>    5V
	  
	  GND   <===>    GND
	  
	  RST   <===>    GPIO0

	  SCK   <===>    SPI_CLK

	  CSN   <===> 	 SPI_CS

	  MISO  <===>    SPI_MISO

	  MOSI  <===>    SPI_MOSI


## Required Hardware	

Before you get started, let's review what you'll need.<br>	
1. WisAp development board -  Buy at Rakwireless - [wisapBoard](https://www.aliexpress.com/store/product/WisAP-MT7628-open-source-hardware-routing-gateway-Openwrt-Arduino-intelligent-speech-recognition-module/2805180_32791851425.html?spm=2114.12010615.0.0.19224b5bsq3LC5)<br> 	
2. Micro-USB power cable<br>
3. Lora Gateway - [RAK831](https://www.aliexpress.com/store/product/RAK831-LoRa-LoRaWAN-Gateway-Module-433-868-915MHz-base-on-SX1301-Wireless-Spread-Spectrum-Transmission-range/2805180_32832894046.html?spm=2114.12010615.0.0.52c53549b1zqQa)<br> 	

## Compile SDK

Compile dependency with ubuntu 16.04

	sudo apt-get install build-essential subversion git-core libncurses5-dev zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl mercurial bzr ecj cvs unzip

### Step 1: Clone SDK
Open terminal, and type the following:<br>

    cd Desktop
    git clone https://github.com/RAKWireless/RAK831-LoRaGateway-OpenWRT-MT7628.git


### Step 2: to set compile environment
Before you run make, you need to set compile environment first with envsetup.sh.

    cd ~/Desktop/RAK831-LoRaGateway-OpenWRT-MT7628
    ./build/envsetup.sh

### Step 3: Run Make to compile

	make

Finally compiled generated files firmware in the folder out/target/bin


## Burn firmware to the board

    cp ~/Desktop/RAK831-LoRaGateway-OpenWRT-MT7628/out/target/bin/firmware /windows/

[How to burn firmware to Board](https://github.com/RAKWireless/wiscore/wiki/Burn-firmware-to-MT762x-Board)<br>


## To Use LoraGW

1. Register an account in [The Things Network Control](https://console.thethingsnetwork.org), then login and register gateway

* Click "GATEWAYS"
<div align=center> <img src="https://github.com/RAKWireless/wiscore/blob/master/img/ThingsC_home.png" /> </div>

* Click "register gateway"
<div align=center> <img src="https://github.com/RAKWireless/wiscore/blob/master/img/ThingsC_reg1.png" /> </div>

* Fill in, "Gateway EUI" is unique and must consist of exactly 8 bytes hexadecimal, and choose "Frequency Plan", here use 868MHz
<div align=center> <img src="https://github.com/RAKWireless/wiscore/blob/master/img/ThingsC_reg2.png" /> </div>

* Click "Register Gateway"
<div align=center> <img src="https://github.com/RAKWireless/wiscore/blob/master/img/ThingsC_reg3.png" /> </div>

* Finally you will see the gateway overview, and Status is not connected
<div align=center> <img src="https://github.com/RAKWireless/wiscore/blob/master/img/ThingsC_reg4.png" /> </div>

2. Connect RAK831 to WisAp

3. Power on, then [setup wifi](https://github.com/RAKWireless/wiscore/wiki/Setup-Wireless)

4. Check the connection of RAK831 and WisAp, excute:

	/usr/bin/lora/test_loragw_reg

It will display:
<div align=center> <img src="https://github.com/RAKWireless/wiscore/blob/master/img/RAK831_WisAp_Spi.png" /> </div>

if failed, you need check the connnection, or you need restart lora gateway first and try again:

	reset_lgw.sh start

5. Check the ID and Service

check the gateway ID(Gateway EUI) and server address ,make sure they are consistent with [The Things Network Control](https://console.thethingsnetwork.org),

	vi /usr/bin/packet_forwarder/local_conf.json

<div align=center> <img src="https://github.com/RAKWireless/wiscore/blob/master/img/wislora_global.png" /> </div>
	
6. Start Lora Gateway

power on the Gateway and the packet_forwarder will auto start. check the log file at /usr/bin/packet_forwarder/log
	

Finally you can see the Status is connected in the gateway overview, then the gateway will be started and you can use it.
<div align=center> <img src="https://github.com/RAKWireless/wiscore/blob/master/img/ThingsC_con.png" /> </div>
