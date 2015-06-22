#!/bin/bash
IMAGE_NAME=glassfish:4.1
JAVA_VERSION="8u25"
JAVA_PKG="jdk-${JAVA_VERSION}-linux-x64.rpm"
JAVA_PKG_MD5="6a8897b5d92e5850ef3458aa89a5e9d7"

# Validate Java Package
echo "====================="

if [ ! -e $JAVA_PKG ]
then
  echo "Download the Oracle JDK ${JAVA_VERSION} RPM for 64 bit and"
  echo "drop the file $JAVA_PKG in this folder before"
  echo "building this image!"
  exit
fi

if [ `uname` != "Darwin" ]
then
  MD5="$JAVA_PKG_MD5  $JAVA_PKG"
  MD5_CHECK="`md5sum $JAVA_PKG`"
else
  MD5="$JAVA_PKG_MD5"
  MD5_CHECK="`md5 -q $JAVA_PKG`"
fi


if [ "$MD5" != "$MD5_CHECK" ]
then
  echo "MD5 for $JAVA_PKG does not match! Download again!"
  exit
fi

docker build -t $IMAGE_NAME .

echo "====================="

docker build -t $IMAGE_NAME .

echo ""
echo "GlassFish Docker Container is ready to be used. To start, run 'dockGlassFish.sh'"


