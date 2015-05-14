# Start off with latest GF image that includes JDK 8
FROM java:8-jdk 

# Maintainer
MAINTAINER Bruno Borges <bruno.borges@oracle.com>

RUN wget -O pcurl.sh "https://raw.githubusercontent.com/brunoborges/pcurl/master/pcurl.sh"
RUN bash pcurl.sh http://dlc-cdn.sun.com/glassfish/4.1/nightly/latest-glassfish.zip && \
    unzip -o latest-glassfish.zip && \
    rm -f latest-glassfish.zip && \
    apt-get autoremove -y --purge wget curl 

# Set environment variables
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:/glassfish4/bin
ENV GLASSFISH_HOME /glassfish4

# Password 
ENV PASSWORD glassfish
RUN echo "AS_ADMIN_PASSWORD=" > /tmp/glassfishpwd && \
    echo "AS_ADMIN_NEWPASSWORD=${PASSWORD}" >> /tmp/glassfishpwd 

# Enable DAS
RUN asadmin --user=admin --passwordfile=/tmp/glassfishpwd change-admin-password --domain_name domain1 && \
    asadmin start-domain && \
    echo "AS_ADMIN_PASSWORD=${PASSWORD}" > /tmp/glassfishpwd && \
    asadmin --user=admin --passwordfile=/tmp/glassfishpwd enable-secure-admin && \
    asadmin --user=admin stop-domain && \
    rm /tmp/glassfishpwd

# Ports being exposed
EXPOSE 4848 8080 8181

# Start Domain by Default
CMD ["asadmin"]
