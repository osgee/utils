# install

packages on <a href="http://mirror.centos.org/centos/7/os/x86_64/Packages/">centos 7 mirror</a>
packages on <a href="http://mirror.centos.org/centos/6/os/x86_64/Packages/">centos 6 mirror</a>

## server
on ubuntu 

	sudo apt -y update
	sudo apt install openssh-server

optional

	service sshd start
	
on centos

	sudo yum install openssh-server
	sudo chkconfig --list sshd

start service

	sudo systemctl sshd start 

or 

	/etc/init.d/sshd start

## client
on ubuntu

	sudo apt -y update
	sudo apt install openssh-client

on centos

	wget http://mirror.centos.org/centos/7/os/x86_64/Packages/openssh-clients-6.6.1p1-22.el7.x86_64.rpm
	rpm -ivh openssh-clients-6.6.1p1-22.el7.x86_64.rpm
	
# ssh-keygen

	$ ssh-keygen -t rsa -b 2048 -P '' -f ~/.ssh/id_rsa

# ssh

### login

	$ ssh USER@HOST -p PORT
	$ ssh HOST -l USER -p PORT

### command without login

	$ ssh -N USER@HOST COMMAND
	$ ssh USER@HOST $(< cmd.txt)
	$ ssh USER@HOST "cat cmd.txt"

### copy id

	$ cat .ssh/id_rsa.pub | ssh USER@HOST "cat >>.ssh/authorized_keys"

### file transfer

using tar compression

local -> remote

	$ tar -zcvf - source/ | ssh USER@HOST "tar -zxvf - -C /destination"

local <- remote

	$ tar -zxvf - -C destination/ < <(ssh USER@HOST "tar -zcvf - /source")

for large file

local -> remote

	$ rsync -partial -progress -rsh=ssh FILE_SOURCE USER@HOST:DESTINATION_FILE

remote -> local

	$ rsync -partial -progress -rsh=ssh USER@HOST:REMOTE_FILE DESTINATION_FILE


### port forwording

#### local

localhost:3000 -> google.com:80

	$ ssh -nNT -L 3000:google.com:80 USER@localhost

localhost:3000 -> SERVER:80

	$ ssh -nNT -L 3000:localhost:80 USER@SERVER	

localhost:3000 -> HOST:22

	$ ssh -CfNg -L 3000:localhost:22 USR@HOST

localhost:3000 -> HOSTA -> HOSTB:22

	$ ssh -CfNg -L 3000:HOSTB:22 USER@HOSTA


#### remote

localhost:22 <- HOST:3000

	$ ssh -nNT -R 3000:localhost:22 USER@HOST

HOSTB:22 <- HOSTA:3000

	$ ssh -CfNg -R 3000:HOSTB:22 USER@HOSTA

#### dynamic

proxy on localhost:3000
localhost:PORT -> HOST:PORT

	$ ssh -CfNg -D 3000 USER@HOST

### jump A to B

	$ ssh -t USER1@REACHABLE_HOST ssh USER2@UNREACHABLE_HOST

### screen

	$ ssh -t USER@HOST screen -r
	$ ssh -t USER@HOST screen -xRR

### mysql db tansfer

	$ mysqldump --add-drop-table -extended-insert -force -log-error=error.log -uUSER -pPASS OLD_DB_NAME | ssh -C USER@HOST "mysql -uUSER -pPASS NEW_DB_NAME"

### bandwidth moniter

	$ yes|pv|ssh USER@HOST "cat>/dev/null"
 
### network moniter

	$ ssh ROOT@HOST 'tshark -f "port !22" -w -' |wireshark -k -i -

tshart can be replaced by tcpdump

	$ ssh ROOT@HOST tcpdump -w - 'port !22' |wireshark -k -i -

### quiker, more stable and stronger client

	$ ssh -4 -C -c blowfish-cbc

# scp 

	$ scp CompressionLevel=9 USER@HOST:DIR/SOURCE/FILE .
	$ scp -C -o -r USER@HOST:/SOURCE/DIR .
	$ scp /FROM/FILE USER@HOST:/TO/FILE
	$ scp -r USER1@HOST1:/SOURCE/DIR1 USER2@HOST2:/TO/DIR2
	
# sshfs

	$ sshfs USER@HOST:/path/to/folder /path/to/mount/point

# Hardware-based SSH/GPG agent

This [project](https://github.com/romanz/trezor-agent) allows you to use various hardware security devices to operate GPG and SSH. Instead of keeping your key on your computer and decrypting it with a passphrase when you want to use it, the key is generated and stored on the device and never reaches your computer. Read more about the design here.

You can do things like sign your emails, git commits, and software packages, manage your passwords (with pass and gopass, among others), authenticate web tunnels and file transfers, and more.





