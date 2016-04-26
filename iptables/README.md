# iptables  

/sbin/iptables

### route graph

tables

        filter/nat/mangle/raw

privilage

        raw>mangle>nat>filter
        
        -----------------------------------------------------------------
        raw        ->      mangle      ->       nat      ->      filter
        prerouting         prerouting           prerouting
                           forward                               forward
                           input                                 input
        output             output               output            output
                           postrouting          postrouting
        -----------------------------------------------------------------

        IN                               OUT
        |                                /\
        \/                               |
        PREROUTING                       POSTROUTING
        ---------                        -----------
        nat                              nat
        mangle                           raw  
        raw                              mangle  
        |
        \/                                   /\  /\
        /----------------------\             |   |
        |Destiantion=localhost?|-> FORWARD --|   |
        \----------------------/no ----------    |
        |yes                       filter        |
        \/                         mangle        |   
        INPUT                                    OUTPUT
        ----------                               ---------
        filter               /----------\        filter
        mangle      ---->    |LOCALHOST |  --->  nat
                             \----------/        mangle
                                                 raw


### Commands

        iptables -h # help
        iptables -L # list rules
        iptables -L -t mangle # list rules in table mangle
        iptables -P INPUT ACCEPT # default rules
        iptables -F # dangerous! clear all rules
        iptables -N # user custom rule chain
        iptables -X # clear custom rule chain
        service iptables save # persist rules
        iptables-save > somefile
        iptables-restore < somefile

### Configure 

using commands

        iptables -A INPUT -p tcp -s 192.168.0.0/24 --dport 80 -j ACCEPT 

        -A append
        -I insert
        -D delete
        -R replace
        + chain [PREROUTING|FORWARD|INPUT|OUTPUT|POSTROUTING]

        -t table name [filter|nat|mangle|raw], default is filter 
        -i input network interface
        -o output network interface
        -p protocol [tcp|udp|{tcp,udp},icmp]
        -s source ip address or subnet
        --sport source port
        -d destination ip address or subnet
        --dport destination port
        -j action [ACCEPT|DROP|REJECT]
        --state state of parcel
        -m module

        modules:

        -m comment --comment "allow http"
        -m connlimit --connlimit-above 30
        -m iprange --src-range 192.168.1.10-192.168.1.20 
        -m layer7  --l7proto qq
        -m mac -mac-source XX.XX.XX.XX.XX
        -m muliport -dport 21,22,80,443
        -m recent
        -m state ESTABLISHED,RELATED
        -m string -algo bm -string baidu

if there are conflicts in rules, caculated rules according to rules with higher order(smaller squence number)

-s -p --sport --dport can be omitted which means any


examples

normal web server with ssh service

        iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
        iptables -A INPUT -p tcp --dport 80 -j ACCEPT
        iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
        iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT  
        iptables -A INPUT -i lo -p all -j ACCEPT
        iptables -A OUTPUT -o lo -p all -j ACCEPT
        iptalbes -P INPUT DROP

limit links

        iptables -I INPUT -p tcp --dport 80 -m connlimit --connlimit-above 50 -j REJECT

change destination ip address, map to subnet ip address

        iptables -t nat -A PREROUTING -i ppp0 -p tcp --dprot 81 -j DNAT --to 192.168.0.2:80
        iptables -t nat -A PREROUTING -i ppp0 -p tcp --dprot 81 -j DNAT --to 192.168.0.1-192.168.0.10

change source ip address, hide subnet ip address

        iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j SNAT --to 1.1.1.1
        iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j SNAT --to 1.1.1.1-1.1.1.10
        
hide address, dynamic ip nat

        iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE

enable forward

        iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
        iptables -A FORWARD -i eth1 -o eh0 -j ACCEPT

filter mac address

        iptables -A FORWARD -m mac --mac -source MAC address -j DROP

drop invalid link

        iptables -A INPUT  -m state --state INVALID -j DROP
        iptables -A OUTPUT -m state --state INVALID -j DROP
        iptables-A FORWARD -m state --state INVALID -j DROP

preset rules

        iptables -A INPUT  -p tcp --dport 22 -j ACCEPT
        iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT

        iptables -P INPUT DROP
        iptables -P OUTPUT ACCEPT
        iptables -P FORWARD DROP

        iptables -A FORWARD -f -m limit --limit 100/s --limit-burst 100 -j ACCEPT
        
        iptables -A FORWARD -p icmp -m limit --limit 1/s --limit-burst 10 -j ACCEPT

configure NAT

init

        iptables -t nat -L
        iptables -F -t nat
        iptables -X -t nat
        iptables -Z -t nat
 
 ban outside net access as subnet ip address

        iptables -t nat -A PREROUTING -i eth0 -s 10.0.0.0/8 -j DROP
        iptables -t nat -A PREROUTING -i eth0 -s 172.16.0.0/12 -j DROP
        iptables -t nat -A PREROUTING -i eth0 -s 192.168.0.0/16 -j DROP

ban specific ip 211.101.46.253

        iptables -t nat -A PREROUTING -d 211.101.46.253 -j DROP

ban specific application, FTP(21)

        iptables -t nat -A PREROUTING -p tcp --dport 21 -j DROP

more accurate one

        iptables -t nat -A PREROUTING -p tcp --dport 21 -d 211.101.46.253 -j DROP

drop invalid links

        iptables -A INPUT   -m state --state INVALID -j DROP
        iptables -A OUTPUT  -m state --state INVALID -j DROP
        iptables -A FORWARD -m state --state INVALID -j DROP

        iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
        iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT

apply settings

        /etc/rc.d/init.d/iptables save
        service iptables restart

more <a href="http://www.cnblogs.com/argb/p/3535179.html">examples</a>