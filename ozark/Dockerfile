# Start off with latest Alpine Linux image
FROM alpine:latest

# Maintainer
MAINTAINER Bruno Borges <bruno.borges@oracle.com>

# Install required packages
RUN apk add --update wget unzip && \
    apk add --repository http://dl-4.alpinelinux.org/alpine/edge/community/ openjdk8

# Set environment variables and default password for user 'admin'
ENV GLASSFISH_PKG glassfish-ozark.zip
ENV GLASSFISH_URL https://java.net/projects/ozark/downloads/download/Docker/glassfish-ozark.zip 
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH $PATH:/glassfish4/bin
ENV GLASSFISH_HOME /glassfish4

RUN wget --no-check-certificate $GLASSFISH_URL && \
    unzip -o $GLASSFISH_PKG && \
    rm -f $GLASSFISH_PKG && \
    apk del wget unzip

# Ports being exposed
EXPOSE 4848 8080 8181

# Start asadmin console by default
CMD ["asadmin", "start-domain", "-v"]

