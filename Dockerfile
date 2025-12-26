FROM tomcat:9-jdk8-openjdk

# 1. Clean default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. DISABLE THE SHUTDOWN PORT (Fixes the "Invalid shutdown command" error)
RUN sed -i 's/port="8005" shutdown="SHUTDOWN"/port="-1" shutdown="SHUTDOWN"/g' /usr/local/tomcat/conf/server.xml

# 3. Create the config directory
RUN mkdir -p /usr/local/tomcat/reference-validator/configuration

# 4. Copy your folder and WAR (Ensure 'configuration' is a folder on GitHub)
COPY configuration/ /usr/local/tomcat/reference-validator/configuration/
COPY referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war

# 5. Environment Variables
ENV REFERENCE_CCDA_CONFIG_PATH=/usr/local/tomcat/reference-validator/configuration/ccdaReferenceValidatorConfig.xml
ENV PORT=8080
ENV CATALINA_OPTS="-Xmx450m -Xms256m"

EXPOSE 8080
CMD ["catalina.sh", "run"]
