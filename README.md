# docker-centos-systemd

CentOS container running systemd in unpriviledged mode

start like this:
```
docker run -d -t -i -v /sys/fs/cgroup:/sys/fs/cgroup:ro dramaturg/centos-systemd
```

