#!/bin/bash

cp ./default.docker-compose.yml  ./docker-compose.yml
cp ./conf/mysql/default.my.cnf  ./conf/mysql/my.cnf
cp ./conf/php/default.php.ini  ./conf/php/php.ini

cp ./conf/nginx/default.nginx.conf  ./conf/nginx/nginx.conf
cp ./conf/nginx/conf.d/default.conf  ./conf/nginx/conf.d/localhost.conf
