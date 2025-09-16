# Multi-stage build for better security and smaller image size
FROM eclipse-temurin:17-jdk-alpine AS builder

# Set the working directory for building
WORKDIR /app

# Copy pom.xml and download dependencies (for better caching)
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

# Make mvnw executable
RUN chmod +x mvnw

# Download dependencies
RUN ./mvnw dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Production stage with minimal runtime image
FROM eclipse-temurin:17-jre-alpine

# Security: Install curl for health checks and remove package cache
RUN apk add --no-cache curl && \
    addgroup -g 1001 -S appgroup && \
    adduser -S appuser -u 1001 -G appgroup

# https://medium.com/@skywalkerhunter/aws-docker-deploy-spring-boot-fe05a00191d9
# added on 31st Oct
LABEL maintainer="Darryl Ng <darryl1975@hotmail.com>"
LABEL description="Secure Dockerfile for deploying Spring Boot to Beanstalk"

# Set the working directory to /app
WORKDIR /app

# Copy the Spring Boot application JAR file from builder stage
COPY --from=builder /app/target/cicd-demo-0.0.1-SNAPSHOT.jar app.jar

# Change ownership to non-root user
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Set environment variables
ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0" \
    SERVER_PORT=5000

# Expose the port that the Spring Boot application is listening on
EXPOSE 5000

# Add health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:5000/actuator/health || exit 1

# Run the Spring Boot application when the container starts
CMD ["java", "-jar", "app.jar"]