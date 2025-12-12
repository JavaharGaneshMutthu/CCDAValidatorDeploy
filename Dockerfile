FROM tomcat:9-jdk11

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file
COPY referenceccdaservice.war /usr/local/tomcat/webapps/referenceccdaservice.war

# Copy your config folder inside Tomcat
COPY config /usr/local/tomcat/config

# (Optional) environment variable to point to config directory
ENV CONFIG_HOME=/usr/local/tomcat/config

EXPOSE 8080

CMD ["catalina.sh", "run"]
