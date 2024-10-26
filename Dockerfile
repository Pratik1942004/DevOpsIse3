# Use an official OpenJDK runtime as a base image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY build/libs/gradle-simple.jar /app/gradle-simple.jar

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "gradle-simple.jar"]