FROM tomcat:9-jdk11

# 1. Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Create and permission log folders
RUN mkdir -p /usr/local/tomcat/logs/ && chmod -R 777 /usr/local/tomcat/logs/

# 3. Copy WAR as ROOT so your URL is simple
COPY referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war

# 4. Force Tomcat to stay on 8080 and disable shutdown port
RUN sed -i 's/port="8005" shutdown="SHUTDOWN"/port="-1" shutdown="SHUTDOWN"/g' /usr/local/tomcat/conf/server.xml

EXPOSE 8080

# 5. Start with memory limits defined here as well for safety
ENV CATALINA_OPTS="-Xmx300m -Xms200m"

CMD ["catalina.sh", "run"]
