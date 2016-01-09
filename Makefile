
all: 
	docker build -t dramaturg/centos-systemd .

run:
	docker run -d -t -i -v /sys/fs/cgroup:/sys/fs/cgroup:ro dramaturg/centos-systemd

