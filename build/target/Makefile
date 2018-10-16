#By Seven 
#make files.
ROOTDIRS=wiswrt products

#make files.
export OUT_PATH=$(ROOT_PATH)/out/target
export LIB_PATH=$(OUT_PATH)/lib
export BIN_PATH=$(OUT_PATH)/bin
export OBJ_PATH=$(OUT_PATH)/obj

 #create output path.
$(shell mkdir -p $(OUT_PATH))
$(shell mkdir -p $(LIB_PATH))
$(shell mkdir -p $(BIN_PATH))
$(shell mkdir -p $(OBJ_PATH))

.PHONY: compile clean install uninstall

compile:
	@list='$(ROOTDIRS)'; for subdir in $$list; do \
    	(echo $(PWD)); \
        (mkdir -p '$(OBJ_PATH)'/$$subdir); \
        (echo $(ROOT_PATH)/$$subdir); \
        (cd $(ROOT_PATH)/$$subdir && make OBJ_PATH='$(OBJ_PATH)'/$$subdir ); \
    done;

clean:
	@list='$(ROOTDIRS)'; for subdir in $$list; do \
		(cd $(ROOT_PATH)/$$subdir && make clean); \
	done;
	rm -rf $(OUT_PATH)

install:

uninstall:


