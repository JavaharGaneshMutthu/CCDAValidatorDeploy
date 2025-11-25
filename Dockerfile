# Use official Tomcat
FROM tomcat:9-jdk11

# Increase memory (optional)
ENV CATALINA_OPTS="-Xms512m -Xmx1024m"

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file
COPY referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war

# Copy full config folder (this includes configs_folder, scenarios, and vocabulary)
COPY config /usr/local/tomcat/config

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
