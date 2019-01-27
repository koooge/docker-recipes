.PHONY: run clean
run:
	gcc -static main.c
	docker build -t ${USER}/alpine-syslog-sample .
	docker run -d --rm --name some-alpine-syslog-sample ${USER}/alpine-syslog-sample
	docker exec some-alpine-syslog-sample /app/a.out
	docker exec some-alpine-syslog-sample cat /var/log/messages

clean:
	docker rm -f some-alpine-syslog-sample
	docker rmi ${USER}/alpine-syslog-sample
