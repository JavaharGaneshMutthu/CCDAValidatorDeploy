FROM tomcat:9-jdk11

# Delete default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Create log directory (your logs showed your app needs this)
RUN mkdir -p /usr/local/tomcat/logs/

# Copy the WAR
COPY referenceccdaservice.war /usr/local/tomcat/webapps/referenceccdaservice.war

# Explicitly tell the environment we use 8080
ENV PORT=8080
EXPOSE 8080

# Run Tomcat on 8080
CMD ["catalina.sh", "run"]
