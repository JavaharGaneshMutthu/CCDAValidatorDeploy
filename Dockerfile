FROM tomcat:9-jdk11

# 1. Clean out default Tomcat apps to save memory
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Copy the WAR using the EXACT name the logs showed: referenceccdaservice
COPY referenceccdaservice.war /usr/local/tomcat/webapps/referenceccdaservice.war

# 3. Create a log directory so Logback doesn't fail (Your logs showed it looking here)
RUN mkdir -p /usr/local/tomcat/logs/

EXPOSE 8080
CMD ["catalina.sh", "run"]
