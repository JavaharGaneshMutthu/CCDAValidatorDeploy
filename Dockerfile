FROM tomcat:9-jdk11
RUN rm -rf /usr/local/tomcat/webapps/*

# DO NOT rename to ROOT.war. Keep the original name:
COPY referenceccdaservice.war /usr/local/tomcat/webapps/referenceccdaservice.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
