FROM tomcat:9-jdk11

# Clear default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR
COPY referenceccdaservice.war /usr/local/tomcat/webapps/referenceccdaservice.war

# Copy validator config
COPY config /usr/local/tomcat/config

ENV REPOSITORY_HOME=/usr/local/tomcat/config

# Copy entrypoint script
COPY render-entrypoint.sh /usr/local/bin/render-entrypoint.sh
RUN chmod +x /usr/local/bin/render-entrypoint.sh

# Render sets the PORT environment variable, do NOT hard-code 8080
EXPOSE 8080

CMD ["/usr/local/bin/render-entrypoint.sh"]
