#By Seven 2017-0306
#make files.
SUBDIRS=target package
# package

export OPWRT_WORKSPACE=$(OPENWRT_PATH)/$(OPENWRT_VERSION)-$(OPENWRT_VENDOR)-$(OPENWRT_VENDOR_VERSION)

.PHONY: compile clean install uninstall

compile:
	cp -rf opwrt-wisap-topv001-1-20180308_config $(OPWRT_WORKSPACE)/.config
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		(echo $(PWD)); \
		(cd $$subdir && make || exit "$$?"); \
	done;
#	cp dl/ -rf $(OPWRT_WORKSPACE)/

clean:

install:

uninstall:

