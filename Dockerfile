FROM tomcat:9-jdk11

# Clear default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy CCDA validator WAR
COPY referenceccdaservice.war /usr/local/tomcat/webapps/referenceccdaservice.war

# Copy validator config files
COPY config /usr/local/tomcat/config

# Environment variable required by the validator
ENV REPOSITORY_HOME=/usr/local/tomcat/config

EXPOSE 8080

CMD ["catalina.sh", "run"]
