
## Setup

### Create Volume

```sh
docker volume create mysql-volume
```

### Stop with deleting volume
```sh
docker-compose down -v
```

### Delete Volume

```sh
docker volume remove mysql-volume
```

### Initialize Script for Database

put scripts in ./scripts

## example

```sh
docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_USER=test -e MYSQL_PASSWORD=test -e MYSQL_DATABASE=test -d mysql:5.7
```

