FROM tomcat:9-jdk11

RUN rm -rf /usr/local/tomcat/webapps/*
RUN mkdir -p /usr/local/tomcat/logs/ && chmod -R 777 /usr/local/tomcat/logs/

# Copy your war as ROOT
COPY referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war

# Force the application to use the "/" path regardless of its internal settings
ENV SPRING_CONFIG_NAME=application
ENV PORT=8080

EXPOSE 8080

# The -D command tells Tomcat to treat this as a simple web app
CMD ["catalina.sh", "run"]
