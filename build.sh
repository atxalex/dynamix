#!/bin/bash
mkdir -p build/usr/local/emhttp/plugins/unraid.s3.sleep/

cp -R source/s3-sleep/*  build/usr/local/emhttp/plugins/unraid.s3.sleep/

cd build
COPYFILE_DISABLE=1 tar -cvf build.tar usr/*
cd ..

xz -z build/build.tar
mv build/build.tar.xz archive/unraid.s3.sleep.txz
md5sum=`md5  archive/unraid.s3.sleep.txz  | cut -d ' ' -f4`
sed -i '' -e "s/MD5  \"[a-f0-9]*\"/MD5  \"${md5sum}\"/g" unRAIDv6/unraid.s3.sleep.plg
rm -rf build/*