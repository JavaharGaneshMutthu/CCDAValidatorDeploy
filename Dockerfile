# Use official Tomcat
FROM tomcat:9-jdk11

# Set environment variables
ENV CATALINA_OPTS="-Xms512m -Xmx1024m"

# Remove default ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR to Tomcat webapps
COPY referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war

# Copy configuration folders (if required)
COPY config /usr/local/tomcat/config
COPY vocab /usr/local/tomcat/vocab

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
