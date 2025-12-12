# ---- Build stage (does nothing but copy files) ----
FROM tomcat:9-jdk11 as builder
WORKDIR /app

# Copy validator files
COPY referenceccdaservice.war /app/
COPY vocabulary/ /app/vocabulary/
COPY ccdaReferenceValidatorConfig.xml /app/
COPY referenceccdaservice.xml /app/

# ---- Run stage ----
FROM tomcat:9-jdk11
ENV CATALINA_OPTS="-Xms512m -Xmx1024m"

# Remove default ROOT
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy built files from builder stage
COPY --from=builder /app/referenceccdaservice.war /usr/local/tomcat/webapps/ROOT.war
COPY --from=builder /app/vocabulary/ /usr/local/tomcat/vocabulary/
COPY --from=builder /app/ccdaReferenceValidatorConfig.xml /usr/local/tomcat/conf/
COPY --from=builder /app/referenceccdaservice.xml /usr/local/tomcat/conf/Catalina/localhost/

EXPOSE 8080

CMD ["catalina.sh", "run"]
