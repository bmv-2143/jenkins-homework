# Steps to configure Docker/Jenkins pipeline

## 1. Build Jenkins Master Docker image

- Dockerfile: `JenkinsMaster/MasterDockerFile`
- Build Command: `docker build -f ./MasterDockerFile -t img-jenkins-master .`

## 2. Build Jenkins Agent Android SDK image

- Dockerfile: `JenkinsAgentForAndroidBuilds/AndroidBuilderDockerfile`
- Build Command: `docker build -f ./AndroidBuilderDockerfile -t img-jenkins-agent-android-builder .`

## 3. Create container using Master Docker image and run it

```bash
docker run -p 8080:8080 -p 50000:50000 -v $HOME/develop/jenkins:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-d --restart=on-failure --name cont-jenkins-master img-jenkins-master
```

## 4. Create pipeline in Jenkins web UI, add Jenkins script to it
- Jenkins script: `JenkinsMaster/JenkinsMasterAndroidBuild`

## 5. Run Jenkins pipeline build
Build artifacts should be located at:
`$HOME/develop/jenkins/workspace/jenkins-homework-pipeline-1/app/build`

## 6. Branch-Dependent Build
If you select the "release" branch (`JenkinsBuildsDependingOnGitBranch/JenkinsBuildsDependingOnGitBranch`) when the 
script starts, it will ask for confirmation (see "Input requested" in the console logs) before executing the 
task to publish to Google Play.

## 7. Gradle Profiler Nightly Builds
You must run the script once (`JenkinsNightlyBuild/JenkinsNightlyBuild`) before it is scheduled for the configured time.