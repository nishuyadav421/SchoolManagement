# Step 1: Start with a pre-configured Tomcat & Java environment
FROM tomcat:10.1-jdk17

# Step 2: Remove the default Tomcat sample apps to keep it clean
RUN rm -rf /usr/local/tomcat/webapps/*

# Step 3: Copy your project's WAR file into the Tomcat webapps folder
# Note: Rename it to ROOT.war so your app opens at http://localhost:8080/ 
# instead of http://localhost:8080/SchoolManagement/
COPY target/SchoolManagement.war /usr/local/tomcat/webapps/ROOT.war

# Step 4: Tell the cloud (Railway) which port to open
EXPOSE 8080

# Step 5: Start Tomcat
CMD ["catalina.sh", "run"]