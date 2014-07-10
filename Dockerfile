#
# Dockerfile for GlassFish 4 Latest Nightly Builds 
# 
# https://github.com/glassfish/docker
#

# Pull base image
FROM dockerfile/java

MAINTAINER Bruno Borges <bruno.borges@oracle.com>

# Add GlassFish to /opt
RUN cd /opt && wget -qO- -O tmp.zip http://dlc.sun.com.edgesuite.net/glassfish/4.0.1/nightly/latest-glassfish.zip && unzip tmp.zip && rm tmp.zip 

# add glassfish user/group
RUN groupadd -r glassfish -g 433 && useradd -u 431 -r -g glassfish -d /opt/glassfish4 -s /sbin/nologin -c "glassfish" glassfish

# set owner of /opt/glassfish
RUN chown -R glassfish:glassfish /opt/glassfish4/*

# default glassfish ports
EXPOSE 4848 8080 8181

# set glassfish user
USER glassfish

# default command to run on container boot
CMD /opt/glassfish4/bin/asadmin start-domain && while true; do sleep 60; done;
