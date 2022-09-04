#!/bin/bash -e

./gradlew clean bootJar

echo "starting docker build"
docker build -t spring-zuul-server:latest .

echo "starting container build"
docker container rm -f spring-zuul || true
docker image prune -f
docker run -d -p 127.0.0.1:8080:8080 --network=frontend --name spring-zuul spring-zuul-server
docker network connect backend spring-zuul
echo "completed deploying docker in local container"