# LICENSE CDDL 1.0 + GPL 2.0
#
# ORACLE DOCKERFILES PROJECT
# --------------------------
# This is the Dockerfile for GlassFish 4.1
# 
# REQUIRED BASE IMAGE TO BUILD THIS IMAGE
# ---------------------------------------
# Make sure you have oraclelinux:7.0 Docker image installed.
# Visit for more info: http://public-yum.oracle.com/docker-images/
#
# REQUIRED FILES TO BUILD THIS IMAGE
# ----------------------------------
# (1) jdk-8u92-linux-x64.rpm
#     Download from http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put all downloaded files in the same directory as this Dockerfile
# Run: 
#      $ sudo sh build.sh
#

# Pull base image.
FROM oraclelinux:7.0 

# Maintainer
# ----------
MAINTAINER Bruno Borges <bruno.borges@oracle.com>

# Environment variables required for this build (do NOT change)
# -------------------------------------------------------------
ENV JAVA_RPM jdk-8u92-linux-x64.rpm
ENV GLASSFISH_PKG http://download.java.net/glassfish/4.1.1/release/glassfish-4.1.1.zip
ENV PKG_FILE_NAME glassfish-4.1.1.zip

# Install and configure Oracle JDK 8
# -------------------------------------
ADD $JAVA_RPM /root/
RUN rpm -i /root/$JAVA_RPM && rm /root/$JAVA_RPM
ENV JAVA_HOME /usr/java/default
ENV CONFIG_JVM_ARGS -Djava.security.egd=file:/dev/./urandom

# Setup required packages (unzip), filesystem, and oracle user
# ------------------------------------------------------------
# Enable this if behind proxy
# RUN sed -i -e '/^\[main\]/aproxy=http://proxy.com:80' /etc/yum.conf
RUN yum install -y unzip && yum clean all
RUN useradd -b /opt -m -s /bin/bash glassfish && echo glassfish:glassfish | chpasswd
RUN cd /opt/glassfish && curl -O $GLASSFISH_PKG && unzip $PKG_FILE_NAME && rm $PKG_FILE_NAME
RUN chown -R glassfish:glassfish /opt/glassfish*

# Default glassfish ports
EXPOSE 4848 8009 8080 8181

# Set glassfish user in its home/bin by default
USER glassfish
WORKDIR /opt/glassfish/glassfish4/bin

# User: admin / Pass: glassfish
RUN echo "admin;{SSHA256}80e0NeB6XBWXsIPa7pT54D9JZ5DR5hGQV1kN1OAsgJePNXY6Pl0EIw==;asadmin" > /opt/glassfish/glassfish4/glassfish/domains/domain1/config/admin-keyfile
RUN echo "AS_ADMIN_PASSWORD=glassfish" > pwdfile

# Default to admin/glassfish as user/pass
RUN \
  ./asadmin start-domain && \
  ./asadmin --user admin --passwordfile pwdfile enable-secure-admin && \
  ./asadmin stop-domain

RUN echo "export PATH=$PATH:/opt/glassfish/glassfish4/bin" >> /opt/glassfish/.bashrc

# Default command to run on container boot
CMD ["/opt/glassfish/glassfish4/bin/asadmin", "start-domain", "--verbose=true"]
