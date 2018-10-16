#seven
#TOOLCHAINDIR=/home/seven/work/mtk/openwrt/mt7620v1505/staging_dir/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/bin
#CC=$(TOOLCHAINDIR)/mipsel-openwrt-linux-uclibc-gcc

PROGS_TW=htest

INSTDIR=$(prefix)/usr/bin
INSTMODE=0755
INSTOWNER=root
INSTGROUP=root

#TW_OBJS=tw.o
#CPPFLAGS+=$(CFLAGS)

all: $(PROGS_TW)

$(PROGS_TW): htest.c
	$(CC) $^ $(LDLIBS) -o $@ 

install: $(PROGS_TW)
	$(INSTALL) -d $(INSTDIR)
	$(INSTALL) -m $(INSTMODE) -o $(INSTOWNER) -g $(INSTGROUP) $(PROGS_TW) $(INSTDIR)

clean:
	rm -f $(PROGS_TW) *.o core
