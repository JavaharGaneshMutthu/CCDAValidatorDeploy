FROM tomcat:9-jdk11

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Create log directory and set permissions
RUN mkdir -p /usr/local/tomcat/logs/ && chmod 777 /usr/local/tomcat/logs/

# Disable the shutdown port to prevent Render from accidentally stopping Tomcat
RUN sed -i 's/port="8005" shutdown="SHUTDOWN"/port="-1" shutdown="SHUTDOWN"/g' /usr/local/tomcat/conf/server.xml

COPY referenceccdaservice.war /usr/local/tomcat/webapps/referenceccdaservice.war

# Set Environment Variables inside Docker
ENV PORT=8080
EXPOSE 8080

CMD ["catalina.sh", "run"]
