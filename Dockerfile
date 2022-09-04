FROM openjdk:11.0.3-slim

VOLUME /tmp

EXPOSE 8080

COPY build/libs/*.jar app.jar

ENTRYPOINT ["java", "-Djava.security.egd-file:/dev/./urandom", "-jar", "/app.jar"]