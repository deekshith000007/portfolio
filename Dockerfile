# Use an official Maven image to build the application
FROM maven:3.8.1-openjdk-11 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app/
WORKDIR /usr/src/app
RUN mvn clean package

# Use a lightweight web server to serve the application
FROM tomcat:9.0.50
COPY --from=build /usr/src/app/target/portfolio.war /usr/local/tomcat/webapps/
