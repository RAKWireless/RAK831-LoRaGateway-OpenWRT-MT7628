#By Seven 
#make files.
#export OPWRT_WORKSPACE=$(OPENWRT_PATH)/$(OPENWRT_VERSION)-$(OPENWRT_VENDOR)-$(OPENWRT_VENDOR_VERSION)

SUBDIRS=base-files kernel network system utils

PKG_DIR=package
PUREWRT_DIR=$(OPENWRT_PATH)/rak/purewrt-$(OPENWRT_VENDOR_VERSION)

.PHONY: compile clean install uninstall

compile:
	./create-package-native.sh $(OPWRT_WORKSPACE) $(PKG_DIR) $(PUREWRT_DIR)
	@list='$(SUBDIRS)'; for subdir in $$list; do \
    	(echo $(PWD)); \
        (cd $$subdir && make ); \
    done;

clean:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		(cd $subdir && make clean); \
	done;

install:

uninstall:


