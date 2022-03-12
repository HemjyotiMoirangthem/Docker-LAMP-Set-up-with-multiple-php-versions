# Localhost Set-up
1. Download the project.
2. Copy your .sql file in the \data\shared folder inside your project folder.
3. Open the project folder in cli.
4. Run the command `docker-compose up`.
5. Go to http://localhost:5000/ in your browser to access phpmyadmin.

## Import database from .sql file inside the shared folder
1. Open cli.
2. Run `docker ps`.
3. Run `docker exec -it <mysql_container_id> /bin/bash`.
4. Run `mysql -uroot -proot`
5. Run `create database <database_name>`.
6. Run `use <database_name>`.
7. Run `source /var/shared/<your_file_name>.sql` to import your .sql file.


## Adjust ports
Go to .env file in the root folder and change the port values to meet your requirements.

## Adjust MYSQL credentials
Go to .env file in the root folder and change the credentials to meet your requirements.

## Virtual Host Set-up
Go to apache\conf\vhosts.conf and set up your virtual host.

## Directory Structure
-------------------

```
apache
    conf/                  contains apache configuration
    php.Dockerfile         apache image dockerfile
    
data
    html/                  contains app folders
    logs/                  contains apache, mysql and php log files
    mysql/                 contains mysql data
    shared/                contains files that are shared to the docker containers

mysql
    conf/                  contains mysql configuration
    mysql.Dockerfile       mysql image dockerfile

php5.6
    conf/                  contains php5.6 configuration
    phpfpm-5.6.Dockerfile  php5.6 fpm image dockerfile

php7.4
    conf/                  contains php7.4 configuration
    phpfpm-7.4.Dockerfile  php7.4 fpm image dockerfile

.env                       Set variables used in docker-compose.yml file

docker-compose.yml         Used to run all the docker containers at once
```
