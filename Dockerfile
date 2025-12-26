FROM tomcat:9-jdk11
RUN rm -rf /usr/local/tomcat/webapps/*
# We use a folder name instead of ROOT.war to see if it helps Tomcat map it
COPY referenceccdaservice.war /usr/local/tomcat/webapps/app.war
# Ensure the WAR is unzipped
RUN mkdir -p /usr/local/tomcat/webapps/app && \
    unzip /usr/local/tomcat/webapps/app.war -d /usr/local/tomcat/webapps/app/
EXPOSE 8080
CMD ["catalina.sh", "run"]
