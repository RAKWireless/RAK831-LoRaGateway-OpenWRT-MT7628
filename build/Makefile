#By Seven create 20170304
# setup globle environment.
CUR_DIR=$(shell pwd)
export ROOT_PATH=$(CUR_DIR)/../
export WISDROID_ROOT_PATH=$(ROOT_PATH)
export WISDROID_VERSION=0.0.1

#Production definitions
ifeq ($(PRODUCT),)
export PRODUCT=wis
endif
ifeq ($(SERVICE),)
export SERVICE=ap
endif
ifeq ($(BOARD),)
export BOARD=wiskey
endif
ifeq ($(CUSTOMER),)
export CUSTOMER=rak
endif

#define build host/target or all images
ifeq ($(BUILD_TARGET),)
export BUILD_TARGET=wisAp	#wisAp/wisAlexa
endif

ifeq ($(WISDROID_KERNEL),)
export WISDROID_KERNEL=mips-linux-4.4.7
endif

#OpenWRT definitions
ifeq ($(OPENWRT_BRANCH),)
export OPENWRT_BRANCH=purewrt
endif
ifeq ($(OPENWRT_VERSION),)
export OPENWRT_VERSION=15.05
endif
ifeq ($(OPENWRT_VENDOR),)
export OPENWRT_VENDOR=rak
endif
ifeq ($(OPENWRT_VENDOR_VERSION),)
export OPENWRT_VENDOR_VERSION=rc1
endif

#Direction definitions
#export TOOL_PATH=$(ROOT_PATH)/tools
#export FRAMEWORK_PATH=$(ROOT_PATH)/framework
export PRODUCT_PATH=$(ROOT_PATH)/products
export OPENWRT_PATH=$(ROOT_PATH)/wiswrt

#make target/ccdroid will be specific operation
ifeq ($(BUILD_TARGET), wisAp)
SUBDIRS=target
else ifeq ($(BUILD_TARGET), wisAlexa)
SUBDIRS=target
else ifeq ($(BUILD_TARGET), wisCore)
SUBDIRS=target
else ifeq ($(BUILD_TARGET), wisLora)
SUBDIRS=target
else
SUBDIRS=host
endif

.PHONY: compile clean install uninstall

compile:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		(cd $$subdir && make); \
	done;
	echo "export ROOT_PATH=$(ROOT_PATH)" > $(ROOT_PATH)/config.mk
	echo "export WISDROID_ROOT_PATH=$(WISDROID_ROOT_PATH)" >> $(ROOT_PATH)/config.mk
	echo "export BUILD_TARGET=$(BUILD_TARGET)" >> $(ROOT_PATH)/config.mk
	echo "export OPENWRT_VERSION=$(OPENWRT_VERSION)" >> $(ROOT_PATH)/config.mk
	echo "export OPENWRT_VENDOR=$(OPENWRT_VENDOR)" >> $(ROOT_PATH)/config.mk
	echo "export OPENWRT_VENDOR_VERSION=$(OPENWRT_VENDOR_VERSION)" >> $(ROOT_PATH)/config.mk
	echo "export OPWRT_WORKSPACE=$(OPWRT_WORKSPACE)" >> $(ROOT_PATH)/config.mk
	echo "export PRODUCT_PATH=$(PRODUCT_PATH)" >> $(ROOT_PATH)/config.mk
	echo "export OPENWRT_PATH=$(OPENWRT_PATH)" >> $(ROOT_PATH)/config.mk

clean:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		(cd $$subdir && make clean); \
	done;

install:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		(cd $$subdir && make install); \
	done;

uninstall:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		(cd $$subdir && make uninstall); \
	done;

#end
