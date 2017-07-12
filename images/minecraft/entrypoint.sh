#!/bin/sh
set -e
MC_ROOT_DIR=/mcroot
MC_APP_DIR=${MC_ROOT_DIR}/app
MC_CONF_DIR=${MC_ROOT_DIR}/conf
${MC_SOURCE_URL:="https://s3.amazonaws.com/Minecraft.Download/versions/1.12/minecraft_server.1.12.jar"}
${MC_JAR_NAME:="minecraft_server.1.12.jar"}

#
# Download minecraft server
#
if [ ! -e $MC_APP_DIR/$MC_JAR_NAME ]; then
  echo "[INFO] Starting download minecraft server jar"
  apk update && apk add ca-certificates wget && wget $MC_SOURCE_URL -O $MC_APP_DIR/$MC_JAR_NAME && apk del ca-certificates wget && rm -rf /var/cache/apk/*
fi

if [ ! -e $MC_APP_DIR/eula.txt ]; then
  echo "[WARNING] eula.txt was not found. This file require and accept for runup Minecraft Server"
fi

#
# Runup minecraft server
#
cd $MC_APP_DIR
java $JAVA_OPTS -jar $MC_APP_DIR/$MC_JAR_NAME nogui