#By Seven 
#make files.
#export OPWRT_WORKSPACE=$(OPENWRT_PATH)/$(OPENWRT_VERSION)-$(OPENWRT_VENDOR)-$(OPENWRT_VENDOR_VERSION)

SUBDIRS=ramips

BOARD_DIR=target/linux

PUREWRT_DIR=$(OPENWRT_PATH)/rak/purewrt-$(OPENWRT_VENDOR_VERSION)

.PHONY: compile clean install uninstall

compile:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
    	(echo $(PWD)); \
		(./create-board-native.sh $(OPWRT_WORKSPACE) $(BOARD_DIR)/ramips $(PUREWRT_DIR) ); \
        (cd $(OPWRT_WORKSPACE) && make $(BOARD_DIR)/clean V=s); \
    done;

clean:


#	@list='$(SUBDIRS)'; for subdir in $$list; do \
#		(cd $subdir && make clean); \
#	done;

install:

uninstall:


