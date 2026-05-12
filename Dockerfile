# Use Apache Tomcat 9 as base image
FROM tomcat:9.0

# Maintainer Information
LABEL maintainer="demo@cloud.com"

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Expose Tomcat port
EXPOSE 8080

# Copy WAR file into Tomcat webapps directory
COPY target/demo-cloud-app.war /usr/local/tomcat/webapps/ROOT.war

# Start Tomcat server
CMD ["catalina.sh", "run"]
