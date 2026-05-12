# Use official Tomcat image
FROM tomcat:9.0



# Remove default apps from Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Expose Tomcat port
EXPOSE 8080

# Copy WAR file from Maven build output
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Start Tomcat server
CMD ["catalina.sh", "run"]
