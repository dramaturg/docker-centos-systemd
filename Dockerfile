FROM centos:centos7
MAINTAINER "Sebastian Krohn" <seb@gaia.sunn.de>

ENV container docker


RUN rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org && \
		rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm && \
		rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm && \
		yum -y install yum-plugin-fastestmirror && \
		yum -y update && \
		yum -y install at cronie yum-cron && \
		sed -i '/^\(apply_updates =\) .*/{s//\1 yes/}' /etc/yum/yum-cron.conf && \
		yum clean all

RUN systemctl mask \
			systemd-remount-fs.service \
			dev-hugepages.mount \
			sys-fs-fuse-connections.mount \
			systemd-logind.service \
			getty.target \
			console-getty.service && \
		cp /usr/lib/systemd/system/dbus.service /etc/systemd/system/&& \
		sed -i 's/OOMScoreAdjust=-900//' /etc/systemd/system/dbus.service

VOLUME [ "/sys/fs/cgroup", "/run", "/tmp" ]

CMD ["/usr/sbin/init"]

