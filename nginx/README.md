# docker-recipes/nginx
HOST: 192.168.33.20
nginx: 192.168.33.20:8080
node-main(proxy): http://192.168.33.20:8080/ -> http://192.168.33.20:3000/
node-sub(redirect): http://192.168.33.20:8080/sub/ -> http://192.168.33.20:3001/

## Usage
up
```
$ docker-compose up -d

$ curl -I http://localhost:8080/
$ curl -I http://localhost:8080/sub/
```

down
```
$ docker-compose down -v
```
