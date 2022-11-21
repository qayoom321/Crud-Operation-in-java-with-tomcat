***tomcat installation*** \
I have need to perform following step
- install and deploy tomcat on docker
- deploy sample war file in tomcat
- connect with database \

Since docker service is already installed on my local system below is ss \

![Alt text](https://github.com/qayoom321/tomcat.md/blob/main/Screenshot%20from%202022-11-21%2016-07-56.png "docker status")

##Step \
Download sample war file from google \
##Step Cteate docker file,below is the content of docker file

FROM tomcat:8.0-alpine
LABEL maintainer="A Qayoom"
ADD sample.war /usr/local/tomcat/webapps/
EXPOSE 8080

