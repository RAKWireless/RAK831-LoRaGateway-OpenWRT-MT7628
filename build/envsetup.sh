#!/bin/sh
#action=${1:-help}
#product=${2:-null}
action=wisLora
product=hgw
option=${3:-null}
echo $action
echo $option

TOPDIR=`pwd`/

PRODUCT=$action
SERVICE=ap

if [ "$product" = "ap" ]; then
    SERVICE=ap
fi
if [ "$product" = "alexa" ]; then
    SERVICE=alexa
fi

BOARD=ramips
CUSTOMER=rak
WISDROID_KERNEL=mips-linux-4.4.7

OPENWRT_BRANCH=purewrt
OPENWRT_VERSION=15.05
OPENWRT_VENDOR=rak
OPENWRT_VENDOR_VERSION=rc2		#current all product are select rc2 SDK

if [ "$action" = "wisCore" ] || [ "$action" = "wisAp" ]; then
	OPENWRT_VENDOR_VERSION=rc2
fi

MAKE_COMMAND="PRODUCT=$PRODUCT \
             SERVICE=$SERVICE \
             BOARD=$BOARD \
             CUSTOMER=$CUSTOMER \
             CCDROID_KERNEL=$CCDROID_KERNEL \
             OPENWRT_BRANCH=$OPENWRT_BRANCH \
             OPENWRT_VERSION=$OPENWRT_VERSION \
             OPENWRT_VENDOR=$OPENWRT_VENDOR \
             OPENWRT_VENDOR_VERSION=$OPENWRT_VENDOR_VERSION"

OPENWRT_TREE=$TOPDIR/wiswrt/$OPENWRT_VERSION-$OPENWRT_VENDOR-$OPENWRT_VENDOR_VERSION
#HARDWARE_TREE=$TOPDIR/hardware/$BOARD
#UBOOT_TREE=$TOPDIR/bootloader/u-boot/$BOARD
#KERNEL_TREE=$TOPDIR/kernel/$WISDROID_KERNEL
OPENWRT_BUILD_TREE=wiswrt/$OPENWRT_VERSION-$OPENWRT_VENDOR-$OPENWRT_VENDOR_VERSION

#CLEAN_DIRS="$HARDWARE_TREE $UBOOT_TREE $KERNEL_TREE"
CLEAN_DIRS="$KERNEL_TREE"

target() {
	cd $TOPDIR/build
    if [ "$option" = "null" ]; then
        echo "Compile target......."
        make $MAKE_COMMAND BUILD_TARGET=$DEF_BUILD_TARGET
        mkdir -p $OPENWRT_TREE
        cd $OPENWRT_TREE
		echo $OPENWRT_TREE
		exit 0
        make $MAKE_COMMAND V=99 -j1
    fi
    if [ "$option" = "clean" ]; then
        echo "Clean target......."
        make $MAKE_COMMAND BUILD_TARGET=target clean
        for i in $CLEAN_DIRS
        do
            echo "Clean temp files and dir.......$i"
            ./clean-tmp.sh $i $BOARD 
        done
    fi

    cd $TOPDIR
}

help() {
        cat <<EOF
Usage: ./make.sh {wisAp/wisAlexa} {product} [options] 

Image type:
        wisAp         Compile the hardware ap image
        wisAlexa      Compile the alexa image
Product:
        ap            rout-ap Gateway
        alexa         amazon AVS
		hgw			  Home Gateway
Options:
        clean         Clean 
        install       Install 
        uninstall     Uninstall 

EOF
}

if [ "$option" != "clean" ] && [ "$option" != "install" ] && [ "$option" != "uninstall" ] && [ "$option" != "null" ]; then
    action=help
fi

if [ "$action" != "wisAp" ] && [ "$action" != "wisAlexa" ] && [ "$action" != "wisCore" ] && [ "$action" != "wisLora" ]; then
    action=help
fi

if [ "$product" != "hgw" ] && [ "$product" != "ngbgw" ] && [ "$product" != "null" ]; then
    action=help
fi

#echo $action
#./set-config.sh $OPENWRT_BUILD_TREE $TOPDIR $BOARD

DEF_BUILD_TARGET=$action

target 

