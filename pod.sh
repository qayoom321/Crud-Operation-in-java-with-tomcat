#!/bin/bash

##Create a pod with name tomcat-db-app and expose port 8080
podman pod create --name tomcat-db-app --publish 8080:8080 --publish 3306:3306
##Create a mariadb container, give it the desired environment variables, attach it to the created pod
podman run -dt \
    --pod tomcat-db-app \
    --name mariadb \
    -e MYSQL_ROOT_PASSWORD=redhat \
    -v /home/keen/data:/var/lib/mysql \
    mariadb
##Create a keycloak container, give it the desired environment variables, importantly DB_VENDOR, attach it to the created pod
podman run -dt \
--pod tomcat-db-app \
--name tomcat \
        -v /home/keen/webapps:/usr/local/tomcat/webapps/ \
tomcat
