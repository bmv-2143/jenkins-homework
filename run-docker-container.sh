#!/usr/bin/env bash

docker run -p 8082:8080 -p 50002:50000 -d --restart=on-failure --name container-otus-homework-jenkins otus-homework-jenkins