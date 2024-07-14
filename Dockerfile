# Use a Tomcat base image
FROM tomcat:9.0-jdk11-openjdk-slim

# Remove existing ROOT webapps to deploy our own
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the .war file into the webapps directory of Tomcat
COPY target/webapp.war /usr/local/tomcat/webapps/

# Expose the port that Tomcat runs on
EXPOSE 7777

# Start Tomcat server
CMD ["catalina.sh", "run"]
