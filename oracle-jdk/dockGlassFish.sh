#!/bin/sh
TMP_CID_FILE=tmp/glassfish.cid
DOCKER_IMAGE_NAME=glassfish:4.1.1
DOCKER_CONTAINER_NAME=glassfish
DEFAULT_ADMIN_PORT=4848
if [ ! -e tmp ]
then
  mkdir tmp
fi

if [ -e "$TMP_CID_FILE" ]
then
  docker kill `cat $TMP_CID_FILE` > /dev/null 2>&1
  if [ $? -ne 0 ]
  then
    rm -f $TMP_CID_FILE
  else
    docker rm `cat $TMP_CID_FILE` > /dev/null 2>&1 && rm $TMP_CID_FILE
  fi
fi

if [ ""$1 = "-attach" ]
then
  ATTACH_DEFAULT_PORTS="-p 4848:4848 -p 8080:8080"
fi

# RUN THE DOCKER COMMAND
docker run -d $ATTACH_DEFAULT_PORTS --cidfile $TMP_CID_FILE --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_NAME

# EXTRACT THE IP ADDRESS
if [ -n "${ATTACH_DEFAULT_PORTS}" ]
then
  ADMIN_IP=127.0.0.1
else
  ADMIN_IP=$(docker inspect --format='{{.NetworkSettings.IPAddress}}' $DOCKER_CONTAINER_NAME)
fi

echo "GlassFish 4 is starting... "
sleep 5
echo "Open GlassFish Admin Console at http://${ADMIN_IP}:${DEFAULT_ADMIN_PORT}/"
