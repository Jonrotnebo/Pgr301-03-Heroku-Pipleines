#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build . --tag pipelinetest --build-arg JAR_FILE=./target/demo-0.0.1-SNAPSHOT.jar
docker tag pipelinetest  jonrot/pipelinetest
docker push jonrot/pipelinetest
docker run -p 8080:8080 jonrot/pipelinetest