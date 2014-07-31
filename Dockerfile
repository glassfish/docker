#
# Dockerfile for GlassFish 4 Latest Nightly Builds 
# 
# https://github.com/glassfish/docker
#

# Pull base image.
FROM dockerfile/ubuntu

MAINTAINER Bruno Borges <bruno.borges@oracle.com>

# Install Java 8
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer

# create glassfish user (pass: glassfish)
RUN useradd -b /opt -m -s /bin/bash glassfish && echo glassfish:glassfish | chpasswd

# add GlassFish to /opt
RUN cd /opt/glassfish && wget -qO- -O tmp.zip http://dlc.sun.com.edgesuite.net/glassfish/4.0.1/nightly/latest-glassfish.zip && unzip tmp.zip && rm tmp.zip 

# set owner of /opt/glassfish
RUN chown -R glassfish:glassfish /opt/glassfish*

# default glassfish ports
EXPOSE 4848 8080 8181

# set glassfish user
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

# default command to run on container boot
CMD ["/opt/glassfish/glassfish4/bin/asadmin", "start-domain", "--verbose=true"]
# CMD ["bash"]
