FROM tomcat:9-jdk8-openjdk

# 1. Clean default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Disable shutdown port (Prevents the 'Invalid Shutdown Command' error)
RUN sed -i 's/port="8005" shutdown="SHUTDOWN"/port="-1" shutdown="SHUTDOWN"/g' /usr/local/tomcat/conf/server.xml

# 3. Create the target directories
RUN mkdir -p /usr/local/tomcat/reference-validator/logs \
             /usr/local/tomcat/reference-validator/results

# 4. Copy your GitHub 'config' folder into the container
# This will result in: /usr/local/tomcat/reference-validator/config/configs_folder/...
COPY config/ /usr/local/tomcat/reference-validator/config/
COPY referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war

# 5. Set Permissions
RUN chmod -R 777 /usr/local/tomcat/reference-validator/

# 6. CRITICAL: The exact path to your XML
ENV REFERENCE_CCDA_CONFIG_PATH=/usr/local/tomcat/reference-validator/config/configs_folder/ccdaReferenceValidatorconfig.xml

# 7. Port and Memory
ENV PORT=8080
ENV CATALINA_OPTS="-Xmx460m -Xms256m"
EXPOSE 8080

CMD ["catalina.sh", "run"]
