# docker-namp

Docker container with Alpine Linux + nginx + php7 + mariadb

Created Spring 2017, xy22y@xy22y.org

## Build container

    docker build -t namp:0.9 .

## Run an instance

    # WEBROOT specifies location of code
    export WEBROOT=/path/to/local/webroot
    # MYSQLROOT specifies location of persisted data
    export MYSQLROOT=/path/to/local/datastore
    docker run --rm --name namp -v $WEBROOT:/var/www -v $MYSQLROOT:/var/lib/mysql -p 18888:80 -p 13306:3306 namp:0.9

## Accessing services

* Browse to http://127.0.0.1:18888/
* Point a MySQL client to 127.0.0.1 port 13306:

    mysql -h 127.0.0.1 -P 13306 -u root -p

Default MySQL password is 'secret' if the instance initializes an empty database, which will happen automatically if you point it to an empty datastore. Change the password, or, better yet, set up new MySQL users once you have it running.

## Open shell in a running instance

    docker exec -it namp sh

