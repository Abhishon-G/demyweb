FROM ubuntu:20.04

# Update the package lists and install OpenJDK 17 and Maven
RUN apt-get update && apt-get install -y openjdk-17-jdk maven

# Clean up APT when done
RUN apt-get clean

# Set the working directory
WORKDIR /app

# Copy the application source code to the image
COPY . /app

# Build the application using Maven
RUN mvn clean install

# Expose the necessary port
EXPOSE 8079

# Set the command to run the application
CMD ["java", "-jar", "target/Demy-0.0.1-SNAPSHOT.war"]
