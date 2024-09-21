
COPY --from=build /usr/src/app/target/portfolio.war /usr/local/tomcat/webapps/
FROM tomcat:9-jre8-alpine

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/portfolio.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
