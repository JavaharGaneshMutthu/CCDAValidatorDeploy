FROM tomcat:9-jdk11

ENV CATALINA_OPTS="-Xms512m -Xmx1024m"

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy as ROOT (IMPORTANT)
COPY referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war

# Config
COPY config /usr/local/tomcat/config
ENV REPOSITORY_HOME=/usr/local/tomcat/config

EXPOSE 8080

CMD ["catalina.sh", "run"]
