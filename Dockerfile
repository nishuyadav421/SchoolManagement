# Purane version ko Java 21 wale version se badal dein
FROM tomcat:10.1-jdk21-openjdk
COPY SchoolManagement.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]