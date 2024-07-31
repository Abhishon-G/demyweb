FROM ubuntu:20.04
RUN apt install openjdk:17-jdk-slim -y
RUN apt update
RUN apt install maven -y
RUN mvn clean install
WORKDIR /app
COPY target/*.war /app/app.war
EXPOSE 8079
CMD ["Java","- jar","/app/app.war"]
