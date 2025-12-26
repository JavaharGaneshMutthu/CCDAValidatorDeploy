FROM tomcat:9-jdk8-openjdk

RUN rm -rf /usr/local/tomcat/webapps/*
RUN mkdir -p /usr/local/tomcat/reference-validator/configuration

# Copy the folder you just uploaded
COPY configuration/ /usr/local/tomcat/reference-validator/configuration/
COPY referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war

# Essential environment variable for ONC Validator
ENV REFERENCE_CCDA_CONFIG_PATH=/usr/local/tomcat/reference-validator/configuration/ccdaReferenceValidatorConfig.xml

ENV PORT=8080
EXPOSE 8080

CMD ["catalina.sh", "run"]
