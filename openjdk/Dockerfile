# Start off with latest Alpine Linux image
FROM alpine:latest

# Maintainer
MAINTAINER Bruno Borges <bruno.borges@oracle.com>

# Set environment variables and default password for user 'admin'
ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=$PATH:$JAVA_HOME/bin

# Install required packages such as OpenJDK 8 and the CA Certificates for SSL support in the JVM
# Configure certificates in JDK trust store
RUN apk add --update ca-certificates && \
    apk add --update --repository http://dl-4.alpinelinux.org/alpine/edge/community/ openjdk8 && \
    find /usr/share/ca-certificates/mozilla/ -name *.crt -exec keytool -import -trustcacerts -keystore $JAVA_HOME/jre/lib/security/cacerts -storepass changeit -noprompt -file {} -alias {} \; && \
    keytool -list -keystore $JAVA_HOME/jre/lib/security/cacerts --storepass changeit 

