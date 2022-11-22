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
check the status of tomcat on browser
![Alt text](https://github.com/qayoom321/tomcat/blob/main/sample-hello.png "tomcat status")


## Step:
Install mysql container with below command 
<p> docker run -itd -p 3306:3306 mysql </p>

## Step:

Configure db in tomcat
---
<p> <Context> </p>                                                                      
   <p> <Resource </p>                                                                  
       <p> name="jdbc/keen" type="javax.sql.DataSource"      </p>                     
       <p> maxActive="100" maxIdle="30" maxWait="10000"   </p>                         
       <p> url="jdbc:mysql://172.17.0.3:3306/keen"     </p>                            
       <p> driverClassName="com.mysql.jdbc.Driver"  </p>                               
       <p> username="root" password="redhat@123" </p>                                     
<p> </Context> </p>                                          

---

Restart and chek the tomcat again its working

### Thanks

