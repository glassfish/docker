# Start off with latest Alpine Linux image
FROM glassfish/openjdk

# Maintainer
MAINTAINER Bruno Borges <bruno.borges@oracle.com>

# Set environment variables and default password for user 'admin'
ENV GLASSFISH_PKG=glassfish-ozark.zip \
    GLASSFISH_URL=https://java.net/projects/ozark/downloads/download/Docker/glassfish-ozark.zip  \
    GLASSFISH_HOME=/glassfish4 \
    PATH=$PATH:/glassfish4/bin

# Install required packages (wget, unzip), download/extract GlassFish
RUN apk add --update wget unzip && \
    wget --no-check-certificate $GLASSFISH_URL && \
    unzip -o $GLASSFISH_PKG && \
    rm -f $GLASSFISH_PKG && \
    apk del wget unzip

# Ports being exposed
EXPOSE 4848 8080 8181

# Start asadmin console by default
CMD ["asadmin", "start-domain", "-v"]
