***tomcat installation*** \
I have need to perform following step
- install and deploy tomcat on docker
- deploy sample war file in tomcat
- connect with database \

Since docker service is already installed on my local system below is ss \

![Alt text](https://github.com/qayoom321/tomcat.md/blob/main/Screenshot%20from%202022-11-21%2016-07-56.png "docker status")

## Step:
Download sample war file from google 
## Step:
Cteate docker file,below is the content of docker file
<p>FROM tomcat:8.0-alpine</p>
<p>LABEL maintainer="A Qayoom"</p>
<p>ADD sample.war /usr/local/tomcat/webapps/</p>
<p>EXPOSE 8080</p>
  
## Step:
Build tomcat docker image with below command

<p>docker build -t tomcat . </p>

## Step:
run tomcat container with below command

<p> docker run -itd -p 8082:8080 tomcat </p>

## Step:

Check the running container status

![Alt text](https://github.com/qayoom321/tomcat.md/blob/main/Screenshot%20from%202022-11-21%2016-33-30.png "container status")

## Step:
Check the tomcat on browser
