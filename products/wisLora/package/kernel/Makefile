#By Seven 
#make files.
SUBDIRS=mac80211
PACKAGE_LOCAL=package/kernel

.PHONY: compile clean install uninstall

compile:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
    	(echo $(PWD)); \
		(cp -rf $$subdir $(OPWRT_WORKSPACE)/$(PACKAGE_LOCAL)); \
    done;

clean:

#	@list='$(SUBDIRS)'; for subdir in $$list; do \
#		(cd $subdir && make clean); \
#	done;

#(cd $(OPWRT_WORKSPACE) && make $(PACKAGE_LOCAL)/$$subdir/clean);

install:

uninstall:


