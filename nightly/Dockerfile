# Start off with latest Alpine Linux image
FROM alpine:latest

# Maintainer
MAINTAINER Bruno Borges <bruno.borges@oracle.com>

# Install required packages
RUN apk add --update wget unzip ca-certificates && \
    apk add --update --repository http://dl-4.alpinelinux.org/alpine/edge/community/ openjdk8

# Set environment variables and default password for user 'admin'
ENV GLASSFISH_PKG latest-glassfish.zip
ENV GLASSFISH_URL http://download.oracle.com/glassfish/5.0/nightly/$GLASSFISH_PKG
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH $PATH:/glassfish4/bin
ENV GLASSFISH_HOME /glassfish4
ENV PASSWORD glassfish

RUN wget --no-check-certificate $GLASSFISH_URL && \
    unzip -o $GLASSFISH_PKG && \
    rm -f $GLASSFISH_PKG && \
    find /usr/share/ca-certificates/mozilla/ -name *.crt -exec keytool -import -trustcacerts -keystore $JAVA_HOME/jre/lib/security/cacerts -storepass changeit -noprompt -file {} -alias {} \; && \
    keytool -list -keystore $JAVA_HOME/jre/lib/security/cacerts --storepass changeit && \
    apk del wget unzip 

# Setup the password file
RUN echo "AS_ADMIN_PASSWORD=" > /tmp/glassfishpwd && \
    echo "AS_ADMIN_NEWPASSWORD=${PASSWORD}" >> /tmp/glassfishpwd 

# Enable DAS, change admin password, and secure admin access
RUN asadmin --user=admin --passwordfile=/tmp/glassfishpwd change-admin-password --domain_name domain1 && \
    asadmin start-domain && \
    echo "AS_ADMIN_PASSWORD=${PASSWORD}" > /tmp/glassfishpwd && \
    asadmin --user=admin --passwordfile=/tmp/glassfishpwd enable-secure-admin && \
    asadmin --user=admin stop-domain && \
    rm /tmp/glassfishpwd

# Ports being exposed
EXPOSE 4848 8080 8181

# Start asadmin console by default
CMD ["asadmin"]
