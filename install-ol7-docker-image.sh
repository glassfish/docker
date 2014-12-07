#!/bin/sh
curl -O http://public-yum.oracle.com/docker-images/OracleLinux/OL7/oraclelinux-7.0.tar.xz
unxz oraclelinux-7.0.tar.xz
sudo docker load -i oraclelinux-7.0.tar
