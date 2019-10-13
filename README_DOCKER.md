# README
Dockerized react-on-rails-antd-boilerplate

**this file is only for instance running and not deployment guide**

----
## REQUIRMENTS
you only need install docker-ce and docker-compose on your computer for this guide.
[docker installation](https://docs.docker.com/install)

----
## CONFIG FILES
create config files:

    cp docker/docker-compose.sample.yml docker/docker-compose.yml
    cp docker/docker.sample.env docker/docker.env

these are configure files and have default values but they will work. you should modify them when you want deploy app.

----
## DATABASE
a sample postgres database is configured in docker-compose.yml but you can remove it and connect your app to another database.

----

## EXIT FROM EVERYTHING
type `exit` to exit from container
and press `controll+c` in old tab of terminal to exit from interactive mode

----
## DEPLOY
your docker configuration is finished you can run this command in docker folder and use your app in port 3000:

    cd docker
    docker-compose up -d

