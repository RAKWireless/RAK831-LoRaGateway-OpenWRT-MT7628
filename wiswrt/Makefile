#make files.
#SUBDIRS=$(OPENWRT_VENDOR) $(OPENWRT_BRANCH)
SUBDIRS=$(OPENWRT_VENDOR)

CURRENT_OPENWRT=$(OPENWRT_VERSION)-$(OPENWRT_VENDOR)-$(OPENWRT_VENDOR_VERSION)

ifeq ($(CURRENT_OPENWRT),$(wildcard $(CURRENT_OPENWRT)))
define clean_version
	@rm -rf $(1)
endef
else
define clean_version
endef
endif

.PHONY: compile clean install uninstall

compile:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		(mkdir -p '$(OBJ_PATH)'/$$subdir); \
		(cd $$subdir && make OBJ_PATH='$(OBJ_PATH)'/$$subdir ); \
	 done;

clean:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		(cd $$subdir && make clean ); \
	done;
	@$(call clean_version,$(CURRENT_OPENWRT))

install:

uninstall:


