FROM tomcat:9-jdk11

RUN rm -rf /usr/local/tomcat/webapps/*

# Creating the log directory (your app crashed without this earlier)
RUN mkdir -p /usr/local/tomcat/logs/ && chmod 777 /usr/local/tomcat/logs/

# Renaming the war to ROOT.war makes it the main app
COPY referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
