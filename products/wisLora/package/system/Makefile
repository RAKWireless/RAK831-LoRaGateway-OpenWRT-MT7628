#By Seven 
#make files.
SUBDIRS=fstools
PACKAGE_LOCAL=package/system

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


