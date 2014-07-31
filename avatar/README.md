# Project Avatar on GlassFish 4.0.1 Nightly Build Docker image

This is a Dockerfile for [Project Avatar](http://avatar.java.net) on top of GlassFish Open Source Edition 4.0.1 Nightly Build. 

## How to Build

To build this Docker container for your own usage, first please download the WebLogic 12c ZIP Free Distribution for Developers and drop the downloaded file in the same folder as the Dockerfile.

1. Checkout the GitHub glassfish/docker repository

        git checkout git@github.com:glassfish/dockerfiles.git

2. Execute the build script

        avatar/build.sh

## Booting up Avatar on GlassFish with Docker

Along with the Dockerfile, one script is also provided to help you run GlassFish easily.

 * dockAvatar.sh

This script will automagically start default **domain1**. Add argument **-attach** to bind ports 4848 and 8080 to the host server. Log will be supressed, and the container will be daemonized. If you want to run GlassFish with ports binded to host and logs printed on STDOUT, run the following command:

    docker run -ti -p 4848:4848 -p 8080:8080 glassfish/avatar /opt/glassfish/glassfish4/bin/asadmin start-domain --verbose=true

## Sample Avatar Application

A sample Avatar application is deployed. Go to http://dockercontainer-ip-address:8080/hello. The source code is located at /opt/glassfish/glassfish4/glassfish/bin/hello

## Deploying Java EE Applications

You can use the GlassFish Maven Plugin or Web Console to deploy applications to the remote servers running on Docker containers.

## Dockerfile Source
All source is on the [glassfish/dockerfiles GitHub repository](https://github.com/glassfish/dockerfiles).

If you find any issues, please report through the [GitHub Issues page](https://github.com/glassfish/dockerfiles/issues).

## License
For the scripts and files hosted in the GitHub [glassfish/dockerfiles](https://github.com/glassfish/dockerfiles/) repository required to build the Docker image are, unless otherwise noted, released under the Common Development and Distribution License (CDDL) 1.0 and GNU Public License 2.0 licenses.
