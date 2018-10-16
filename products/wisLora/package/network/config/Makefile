#By Seven 
#make files.
SUBDIRS=firewall
PACKAGE_LOCAL=package/network/config

.PHONY: compile clean install uninstall

compile:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
    	(echo $(PWD)); \
		(echo "================================================ooooooooooooooooooooooooo"); \
    	(echo $(OPWRT_WORKSPACE)); \
		(cp -rf $$subdir $(OPWRT_WORKSPACE)/$(PACKAGE_LOCAL)); \
    done;

clean:

#	@list='$(SUBDIRS)'; for subdir in $$list; do \
#		(cd $subdir && make clean); \
#	done;

#(cd $(OPWRT_WORKSPACE) && make $(PACKAGE_LOCAL)/$$subdir/clean);

install:

uninstall:


