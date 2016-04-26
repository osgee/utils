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
	iptables -X # clear custom rules
	service iptables save # persist rules

### Configure

	
