FROM tomcat:10-jdk17
COPY SchoolManagement.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]