
## Setup

### Create Volume

```sh
docker volume create postgres-volume
```

### Delete Volume

```sh
docker volume remove postgres-volume
```

### Initialize Script for Database

put scripts in ./scripts


### example

```sh
$ docker run -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=test -d postgres
```
