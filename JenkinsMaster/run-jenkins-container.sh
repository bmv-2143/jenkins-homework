#!/usr/bin/env bash

docker run -p 8080:8080 -p 50000:50000 -v $HOME/develop/jenkins:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-d --restart=on-failure --name cont-jenkins-master img-jenkins-master