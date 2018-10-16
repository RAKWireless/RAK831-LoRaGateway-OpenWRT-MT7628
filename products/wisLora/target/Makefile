#By Seven 
#make files.
#export OPWRT_WORKSPACE=$(OPENWRT_PATH)/$(OPENWRT_VERSION)-$(OPENWRT_VENDOR)-$(OPENWRT_VENDOR_VERSION)

SUBDIRS=linux

.PHONY: compile clean install uninstall

compile:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
    	(echo $(PWD)); \
        (cd $$subdir && make ); \
    done;

clean:


#	@list='$(SUBDIRS)'; for subdir in $$list; do \
#		(cd $subdir && make clean); \
#	done;

install:

uninstall:


