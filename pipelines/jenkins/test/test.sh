#!/bin/bash
 

#

echo "===================="
echo "--- building jar ---"
echo "===================="

docker run --rm -v /root/.m2/:/root/.m2 -v $PWD/java-app:/app -w /app maven:3-alpine mvn test