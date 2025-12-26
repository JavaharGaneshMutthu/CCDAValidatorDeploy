FROM tomcat:9-jdk8-openjdk

# 1. Clean default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. DISABLE THE SHUTDOWN PORT 
RUN sed -i 's/port="8005" shutdown="SHUTDOWN"/port="-1" shutdown="SHUTDOWN"/g' /usr/local/tomcat/conf/server.xml

# 3. CREATE ALL REQUIRED DIRECTORIES (Crucial step)
# This app requires a place to write validation results and logs
RUN mkdir -p /usr/local/tomcat/reference-validator/configuration \
             /usr/local/tomcat/reference-validator/logs \
             /usr/local/tomcat/reference-validator/temp \
             /usr/local/tomcat/reference-validator/results

# 4. SET FULL PERMISSIONS
RUN chmod -R 777 /usr/local/tomcat/reference-validator/

# 5. COPY YOUR FILES (Ensure 'configuration' is a FOLDER on GitHub)
COPY configuration/ /usr/local/tomcat/reference-validator/configuration/
COPY referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war

# 6. ENVIRONMENT VARIABLES
ENV REFERENCE_CCDA_CONFIG_PATH=/usr/local/tomcat/reference-validator/configuration/ccdaReferenceValidatorConfig.xml
ENV PORT=8080
# Increase memory slightly; 512MB is tight for this app
ENV CATALINA_OPTS="-Xmx460m -Xms256m"

EXPOSE 8080
CMD ["catalina.sh", "run"]
