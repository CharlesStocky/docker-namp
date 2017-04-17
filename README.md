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

## Open shell in a running instance

    docker exec -it namp sh

