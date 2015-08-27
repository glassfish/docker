# Start off with latest GF image that includes JDK 8
FROM java:8-jdk 

# Maintainer
MAINTAINER Bruno Borges <bruno.borges@oracle.com>

# Set environment variables and default password for user 'admin'
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:/glassfish4/bin
ENV GLASSFISH_HOME /glassfish4
ENV PASSWORD glassfish

RUN wget -O pcurl.sh "https://raw.githubusercontent.com/brunoborges/pcurl/master/pcurl.sh" && \
    bash pcurl.sh http://download.java.net/glassfish/4.1/release/glassfish-4.1.zip && \
    unzip -o glassfish-4.1.zip && \
    rm -f glassfish-4.1.zip && \
    apt-get autoremove -y --purge wget curl

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
