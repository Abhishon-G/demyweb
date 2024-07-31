FROM ubuntu:20.04
RUN apt-get update && apt-get install -y openjdk-17-jdk maven
WORKDIR /app
COPY . /app
RUN mvn clean install
EXPOSE 8079
CMD ["java", "-jar", "target/Demy-0.0.1-SNAPSHOT.war"]
