#!/bin/sh
TOPDIR=`pwd`

WORKDIR=$1
PACKAGE=$2
SRCDIR=$3
DESTDIR=$4

echo "Creating openWRT $DESTDIR from $PACKAGE....."

if [ ! -e $WORKDIR ] ; then
   echo "ERROR: $WORKDIR does not exist"
   exit 1
fi
if [ ! -e $PACKAGE ] ; then
   echo "ERROR: $PACKAGE does not exist"
   exit 1
fi
if [ -e $DESTDIR ] ; then
   echo "INFO: $DESTDIR exist, it will be used as currrent workspace"
   cd $DESTDIR
   make clean
   #rm -rf $DESTDIR
   exit 0

fi
if [ -e $SRCDIR ] ; then
   echo "INFO: $SRCDIR exist, it will be used as source"
fi

cd $WORKDIR
#create workspace directory
if [ ! -e $SRCDIR ] ; then
#   tar xvzf $PACKAGE 
	cp $PACKAGE -rfa ./
	if [ ! -d $SRCDIR/dl ]; then
		mkdir -p $SRCDIR/dl
	fi
	
	if [ -e $WORKDIR/rak/dl.tar.gz ]; then
		tar zxvf $WORKDIR/rak/dl.tar.gz -C $SRCDIR
	fi

	if [ -e $WORKDIR/rak/dl ] ; then
		cp $WORKDIR/rak/dl/* -rf $SRCDIR/dl/
	fi
	
	if [ -e $WORKDIR/rak/feeds.tar.gz ]; then
		tar zxvf $WORKDIR/rak/feeds.tar.gz -C $SRCDIR
	fi
fi
mv $SRCDIR $DESTDIR 

cd $DESTDIR
#remove the *.o files, otherwise compile error in diff platform
#ls scripts/config/*.o >.scripts.config.o.tmp
#while read i
#do
#    echo 'removed...' $i 
#    rm -rf $i
#done<.scripts.config.o.tmp
#rm .scripts.config.o.tmp

#remove .svn files, we won't use svn
#find ./ -name ".svn" > .remove-svn.tmp
#while read i
#do
#    echo 'removed...' $i 
#    rm -rf $i
#done<.remove-svn.tmp
#rm .remove-svn.tmp


#remove temp directories
for i in tmp staging_dir build_dir
do
    if [ -e $i ] ; then
        echo 'removed...' $i 
        rm -rf $i
    fi
done

cd $CURDIR

