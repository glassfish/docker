#
# Dockerfile for Project Avatar on GlassFish 4 Latest Nightly Build
# 
# https://github.com/glassfish/dockerfiles

# Pull base image
FROM glassfish/javaee

MAINTAINER Bruno Borges <bruno.borges@oracle.com>

USER glassfish

# add Avatar to GlassFish home
RUN cd /opt/glassfish/glassfish4/glassfish && wget -qO- -O avatar.zip https://avatar.java.net/builds/1.0-ea/avatar-1.0-ea.zip && unzip avatar.zip && rm avatar.zip

ENV AVATAR_HOME /opt/glassfish/glassfish4/glassfish

# set owner of /opt/glassfish
RUN chown -R glassfish:glassfish /opt/glassfish*

WORKDIR /opt/glassfish/glassfish4/glassfish/bin

RUN echo "export PATH=$PATH:/opt/glassfish/glassfish4/glassfish/bin" >> /opt/glassfish/.bashrc

RUN /opt/glassfish/glassfish4/glassfish/bin/avatar new --example=hello
RUN \
  /opt/glassfish/glassfish4/glassfish/bin/asadmin start-domain && \
  /opt/glassfish/glassfish4/glassfish/bin/asadmin --user admin --passwordfile /opt/glassfish/glassfish4/bin/pwdfile deploy hello && \
  /opt/glassfish/glassfish4/glassfish/bin/asadmin stop-domain

# default command to run on container boot
CMD ["/opt/glassfish/glassfish4/bin/asadmin", "start-domain", "--verbose=true"]
# CMD ["bash"]
