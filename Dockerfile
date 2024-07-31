FROM ubuntu:20.04

# Update the package lists and install OpenJDK 17 and Maven
RUN apt-get update && apt-get install -y openjdk-17-jdk maven

RUN mvn clean install

# Set the working directory
WORKDIR /app

# Copy the WAR file into the container
COPY target/*.war /app/app.war

# Expose the necessary port
EXPOSE 8079

# Set the command to run the application
CMD ["java", "-jar", "/app/app.war"]
