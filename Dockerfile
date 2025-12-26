FROM tomcat:9-jdk8-openjdk

# 1. Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Copy your WAR as ROOT to simplify the URL
COPY referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war

# 3. Create the mandatory logs directory
RUN mkdir -p /usr/local/tomcat/logs/ && chmod -R 777 /usr/local/tomcat/logs/

# 4. Set Java Options (ONC validator is memory heavy)
ENV CATALINA_OPTS="-Xmx512m -Xms256m"
ENV PORT=8080

EXPOSE 8080
CMD ["catalina.sh", "run"]
