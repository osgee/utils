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

	$ tar -zcvf - destination/ | ssh USER@HOST "tar -zxvf - -C /source"

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

	$ sshfs USER@HOST:/path/to/folder /paht/to/mount/point


