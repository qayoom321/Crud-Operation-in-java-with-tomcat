**Run java sample war with crus operation**

**Step:** Clone source code from below git link:

<https://github.com/IsuruX98/Basic-Java-CRUD>

The code is not run on tomcat 9 then I put question on all emp and performed the following step after varad sir instruction

\--------------------------------

**Step:** install maven by following below link

<https://www.digitalocean.com/community/tutorials/install-maven-linux-ubuntu>

**Step:** generate a new project structure for war

keen@keen:~$ mkdir test-code


keen@keen:~/test-code$ git clone <https://github.com/IsuruX98/Basic-Java-CRUD.git>

keen@keen:~/test-code$ vim generate.sh

mvn archetype:generate -DgroupId=**dev.abdul** \
`                       `-DartifactId=**java-crud-webapp** \
`                       `-Dversion=**1.0-SNAPSHOT** \
`                       `-DarchetypeArtifactId=maven-
`                       `-DinteractiveMode=false

\----------------------------------------------------

while run the script

keen@keen:~/test-code$ sh generate.sh

its give following output

![](Aspose.Words.b1c5e851-2be7-412c-877e-9f96e080e9a5.001.png)

that mean build is successfull and new directory is generated

![](Aspose.Words.b1c5e851-2be7-412c-877e-9f96e080e9a5.002.png)


**Step:** i have change and edit the pom.xml file with content.

\=============================

<project xmlns="[http://maven.apache.](http://maven.apache.org/POM/4.0.0)" xmlns:xsi="[http://www.w3.org/](http://www.w3.org/2001/XMLSchema-instance)"
`  `xsi:schemaLocation="[http://](http://maven.apache.org/POM/4.0.0) [http://maven.apache.org/maven-](http://maven.apache.org/maven-v4_0_0.xsd)">
`  `<modelVersion>4.0.0</
`  `<groupId>dev.abdul</groupId>
`  `<artifactId>java-crud-webapp</
`  `<packaging>war</packaging>
`  `<version>1.0-SNAPSHOT</
`  `<name>java-crud-webapp Maven Webapp</name>
`  `<url>[http://maven.apache.org](http://maven.apache.org/)</
`  `<properties>
`     `<maven.compiler.source>1.8</
`     `<maven.compiler.target>1.8</
`  `</properties>
`  `<dependencies>
`    `<dependency>
`      `<groupId>junit</groupId>
`      `<artifactId>junit</artifactId>
`      `<version>3.8.1</version>
`      `<scope>test</scope>
`    `</dependency>
`    `<!-- [https://mvnrepository.com/](https://mvnrepository.com/artifact/mysql/mysql-connector-java) -->
`    `<dependency>
`      `<groupId>mysql</groupId>
`      `<artifactId>mysql-connector-
`      `<version>8.0.30</version>
`    `</dependency>
`    `<!-- [https://mvnrepository.com/](https://mvnrepository.com/artifact/org.glassfish.web/jakarta.servlet.jsp.jstl) -->
`    `<dependency>
`      `<groupId>org.glassfish.web</
`      `<artifactId>jakarta.servlet.
`      `<version>2.0.0</version>
`    `</dependency>
`    `<!-- [https://mvnrepository.com/](https://mvnrepository.com/artifact/jakarta.servlet.jsp.jstl/jakarta.servlet.jsp.jstl-api) -->
`    `<dependency>
`      `<groupId>jakarta.servlet.jsp.
`      `<artifactId>jakarta.servlet.
`      `<version>2.0.0</version>
`    `</dependency>
`    `<!-- [https://mvnrepository.com/](https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api) -->
`    `<dependency>
`    `<groupId>javax.servlet</
`      `<artifactId>javax.servlet-api<
`      `<version>3.1.0</version>
`      `<scope>provided</scope>
`    `</dependency>
`    `<!-- [https://mvnrepository.com/](https://mvnrepository.com/artifact/javax.servlet/jstl) -->
`    `<dependency>
`      `<groupId>javax.servlet</
`      `<artifactId>jstl</artifactId>
`      `<version>1.2</version>
`    `</dependency>
`    `<!-- [https://mvnrepository.com/](https://mvnrepository.com/artifact/javax.servlet.jsp.jstl/jstl-api) -->
`    `<dependency>
`      `<groupId>javax.servlet.jsp.
`      `<artifactId>jstl-api</
`      `<version>1.2</version>
`    `</dependency>


`  `</dependencies>
`  `<build>
`    `<finalName>java-crud-webapp</
`  `</build>
</project>

\===============================================

**Step:** copy the source file

keen@keen:~/test-code/java-crud-webapp$ rsync -avz /home/keen/test-code/Basic-Java-CRUD/signup/src/ /home/keen/test-code/java-crud-webapp/src/

**Step:** remove the static library files

keen@keen:~/test-code/java-crud-webapp$ rm -rf src/main/webapp/WEB-INF/lib/\*

**Step:** install the podman with below link

<https://podman.io/new/2021/06/16/new.html>

**Step:** run podman pod and two container one of tomcat and one mariadb with below script

keen@keen:~$ cat pod.sh

#!/bin/bash

##Create a pod with name tomcat-db-app and expose port 8080

podman pod create --name tomcat-db-app --publish 8080:8080 --publish 3306:3306

##Create a mariadb container, give it the desired environment variables, attach it to the created pod

podman run -dt \

`    `--pod tomcat-db-app \

`    `--name mariadb \

`    `-e MYSQL\_ROOT\_PASSWORD=redhat \

`    `-v /home/keen/data:/var/lib/mysql \

`    `mariadb

##Create a keycloak container, give it the desired environment variables, importantly DB\_VENDOR, attach it to the created pod

podman run -dt \

--pod tomcat-db-app \

--name tomcat \

`        `-v /home/keen/webapps:/usr/local/tomcat/webapps/ \

tomcat

![](Aspose.Words.b1c5e851-2be7-412c-877e-9f96e080e9a5.003.png)

**Step:** install mariadb client on my local system

**Step:** connect mariadb on local system

keen@keen:~$ mariadb -h 127.0.0.1 -u root -p

**Step:** create db

**Step:** create table with below commands

\--------------------------------

CREATE TABLE users(userid INT NOT NULL AUTO\_INCREMENT,uname VARCHAR(50) NOT NULL,upwd VARCHAR(60) NOT NULL,uemail VARCHAR(30) NOT NULL,umobile VARCHAR(10) NOT NULL, type VARCHAR(5) NOT NULL DEFAULT 'user', PRIMARY KEY(userid));

\--------------------------------------------------

**Step:**  chnage the DB configration in “DBConnect.java” file

**Step:** build the war with below command

keen@keen:~/test-code/java-crud-webapp$ mvn package

**Step:** deploy the newly created war in podman tomcat container

I have mount the volume for tomcat and copy the war on mounted directory

**Step:**  run the application on browser and it look like this

![](Aspose.Words.b1c5e851-2be7-412c-877e-9f96e080e9a5.004.png)





![](Aspose.Words.b1c5e851-2be7-412c-877e-9f96e080e9a5.005.png)**Step:** insert the user detail in create an account option,agree term and condition

and submit and its look like this after submiting


**Step:** while checking the table detail all user are shown there which i have inserted through

through created option

\------------------------------------






![](Aspose.Words.b1c5e851-2be7-412c-877e-9f96e080e9a5.006.png)                                                                                                                                                                    

**Mistake I have commited following are the mistake i have commited before resolving the issue**

\---------------------------------------------------

1.db connection syntax:i have change localhost instead of ip in "DBConnect.java"

2.create container in a pod instead of different container

3.Initially i have also not configure the db schema as per code requirement and schema
\--------------------------------------------

