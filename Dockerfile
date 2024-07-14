# Stage 1: Build Maven Application
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -B dependency:go-offline

COPY src ./src
RUN mvn -B clean package -DskipTests

# Stage 2: Create Docker Image with Java Application
FROM adoptopenjdk:11-jre-hotspot
WORKDIR /app

# Copy the compiled JAR file from the previous stage
COPY --from=build /app/target/webapp.war /app/webapp.war

# Expose the port that your application runs on
EXPOSE 7777

# Command to run your application
CMD ["java", "-jar", "webapp.war"]
