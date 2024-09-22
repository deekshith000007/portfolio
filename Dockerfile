<<<<<<< HEAD
=======
FROM tomcat:9-jre8-alpine

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/portfolio.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
>>>>>>> d06d74315b3d71a9f40749b525372529f1c8c3d7
