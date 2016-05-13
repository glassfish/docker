# GlassFish 4.1.1 Docker image

This is a Dockerfile for [GlassFish Open Source Edition](http://www.glassfish.org) for version 4.1.1. The purpose of this Docker container is to facilitate the setup of development and integration testing environments for developers.

## Install Oracle Linux 7 Base Docker Image
The Dockerfiles contained in this project will build images based on the Oracle Linux 7.0 Base Docker Image.
For more information and documentation, read the [Docker Images from Oracle Linux](http://public-yum.oracle.com/docker-images) page.

## How to build

1. Clone the GitHub glassfish/dockerfiles repository

	$ git clone git@github.com:glassfish/docker.git glassfish-docker
	
	$ cd glassfish-docker

2. [Download](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) and drop the Oracle JDK 8u92 RPM 64bit file **jdk-8u92-linux-x64.rpm** in this folder

	Linux x64       153 MB        jdk-8u92-linux-x64.rpm

3. Execute the build script as root

	$ sudo sh build.sh

## Default Username and Password
The image and the default domain are built with the following credentials:

 * Username: admin
 * Password: glassfish

## Booting up GlassFish on Docker

Along with the Dockerfile, one script is also provided to help you run GlassFish easily. To boot GlassFish, execute

	$ sudo sh dockGlassFish.sh -attach

This script will automagically start default **domain1** and bind ports 4848 and 8080 to the host server. Log will be supressed, and the container will be daemonized. If you want to run GlassFish with ports binded to host, with log files on STDOUT, run the following command:

	$ sudo docker run -ti -p 4848:4848            \
		-p 8080:8080 glassfish:4.1.1          \
		/opt/glassfish/glassfish4/bin/asadmin \
		start-domain --verbose=true

Because **asadmin** by default will exit after **start-domain**, make sure to add **--verbose=true** to keep the process running in foreground. This way, Docker will keep it running.

## Deploying Java EE Applications

You can use the GlassFish Maven Plugin or the Web Console to deploy applications to the remote servers running on Docker containers.

## Dockerfile Source
All source is on the [glassfish/docker GitHub repository](https://github.com/glassfish/docker).

If you find any issues, please report through the [GitHub Issues page](https://github.com/glassfish/docker/issues).

## License
For the scripts and files hosted in the GitHub [glassfish/dockerfiles](https://github.com/glassfish/docker/) repository required to build the Docker image are, unless otherwise noted, released under the Common Development and Distribution License (CDDL) 1.0 and GNU Public License 2.0 licenses.
