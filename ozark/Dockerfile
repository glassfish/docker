# Start off with latest GF image that includes JDK 8
FROM glassfish:latest

# Maintainer
MAINTAINER Bruno Borges <bruno.borges@oracle.com>

# Set working directory
WORKDIR /usr/local/glassfish4

# Nuke old GF to overlay Ozark's version
RUN rm -rf /usr/local/glassfish4/* && \
    wget https://java.net/projects/ozark/downloads/download/Docker/glassfish-ozark.zip && \
    unzip -o glassfish-ozark.zip && \
    rm -f glassfish-ozark.zip

# Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Start GF
ENTRYPOINT ["asadmin", "start-domain", "-v"]

# Ports being exposed
EXPOSE 4848
EXPOSE 8080
EXPOSE 8181
