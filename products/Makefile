#make files.
SUBDIRS=$(PRODUCT)

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

install:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		(cd $$subdir && make install ); \
	done;

uninstall:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		(cd $$subdir && make uninstall ); \
	done;

