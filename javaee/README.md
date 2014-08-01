# GlassFish 4.0.1 Nightly Build Docker image

This is a Dockerfile for [GlassFish Open Source Edition](http://www.glassfish.org) Nightly Build for upcoming version 4.0.1. The purpose of this Docker container is to facilitate the setup of development and integration testing environments for developers.

## How to Build

1. Checkout the GitHub glassfish/dockerfiles repository

        git checkout git@github.com:glassfish/dockerfiles.git

2. Execute the build script

        javaee/build.sh

## Booting up GlassFish on Docker

Along with the Dockerfile, one script is also provided to help you run GlassFish easily. To boot GlassFish, execute

    dockGlassFish.sh

This script will automagically start default **domain1** and bind ports 4848 and 8080 to the host server. Log will be supressed, and the container will be daemonized. If you want to run GlassFish with ports binded to host, with log files on STDOUT, run the following command:

    docker run -ti -p 4848:4848 -p 8080:8080 glassfish/javaee /opt/glassfish/glassfish4/bin/asadmin start-domain --verbose=true

## Deploying Java EE Applications

You can use the GlassFish Maven Plugin or the WLST (WebLogic Scripting Tool) to deploy applications to the remote servers running on Docker containers.

## Dockerfile Source
All source is on the [glassfish/dockerfiles GitHub repository](https://github.com/glassfish/dockerfiles).

If you find any issues, please report through the [GitHub Issues page](https://github.com/glassfish/dockerfiles/issues).

## License
For the scripts and files hosted in the GitHub [glassfish/dockerfiles](https://github.com/glassfish/dockerfiles/) repository required to build the Docker image are, unless otherwise noted, released under the Common Development and Distribution License (CDDL) 1.0 and GNU Public License 2.0 licenses.

