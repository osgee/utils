# install

### centos 

rpm <a href="http://pkgs.repoforge.org/axel/">repos</a>

centos 64

	wget -c http://pkgs.repoforge.org/axel/axel-2.4-1.el6.rf.x86_64.rpm
	rpm -ivh axel-2.4-1.el6.rf.x86_64.rpm

centos 32

	wget -c http://pkgs.repoforge.org/axel/axel-2.4-1.el6.rf.i686.rpm
	rpm -ivh axel-2.4-1.el6.rf.i686.rpm

install from src

	wget -c http://pkgs.repoforge.org/axel/axel-2.4-1.rf.src.rpm
	rpm --recompile axel-2.4-1.rf.src.rpm

or 

	rpm --rebuild axel-2.4-1.rf.src.rpm

### debian/ubuntu

	apt-get install axel

# usage

### paramaters

	-n number of threads
	-o save to file
	-s max speed
	-q quit download

### eg.

	axel -n 5 "http://pan.baidu.com/s/1sjLNOqL” 


