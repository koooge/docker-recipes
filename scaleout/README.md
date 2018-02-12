# docker-compose/scaleout
scale out sample using docker-compose

## usage
up a contianer

```
$ docker-compose up -d
$ docker-compose ps
Name           Command    State            Ports
---------------------------------------------------------------
scaleout_webapp_1   npm start   Up      0.0.0.0:32769->3000/tcp
```

down

```
$ docker-compose down
```

up 3 containers

```
$ docker-compose up -d --sclae webapp=3
Name           Command    State            Ports
---------------------------------------------------------------
scaleout_webapp_1   npm start   Up      0.0.0.0:32770->3000/tcp
scaleout_webapp_2   npm start   Up      0.0.0.0:32771->3000/tcp
scaleout_webapp_3   npm start   Up      0.0.0.0:32772->3000/tcp
```

down
```
$ docker-compose down
```
