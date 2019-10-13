#!/bin/bash

cp ../java-app/target/*.jar build/


echo "====================="
echo "===CREANDO IMAGEN===="
echo "====================="

cd build && docker-compose build --no-cache