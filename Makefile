
all: 
	docker build -t dramaturg/centos-systemd .

rebuild:
	docker pull centos:7
	docker build --no-cache=true -t dramaturg/centos-systemd .

push:
	docker tag -f dramaturg/centos-systemd dramaturg/centos-systemd:$$(date +%Y%m%d) 
	docker push dramaturg/centos-systemd

run:
	docker run -d -t -i -v /sys/fs/cgroup:/sys/fs/cgroup:ro dramaturg/centos-systemd

