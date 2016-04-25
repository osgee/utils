# vsftp

### Install

#### Centos/RedHat

	yum -y install vsftpd
	rmp -ivh vsftp*.rmp

#### Debian/Ubuntu

	apt -y install vsftpd

### Service

	service vsftpd start
	service vsftpd stop
	service vsftpd restart
	service vsftpd status
	/etc/init.d/vsftpd.sh start
	/etc/init.d/vsftpd.sh stop
	/etc/init.d/vsftpd.sh restart

### Commands

	ftp ftp://<name>:<pass>@<host>/
	ftp --help
	ftp>help

