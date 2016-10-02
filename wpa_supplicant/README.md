#wpa_supplicant

### configure

using template wpa_supplicant.conf, replace the pass

	$ wpa_passphrase SSID PASS > ~/wpa_pass.conf

check the net interface card

	$ iwconfig
	$ wpa_supplicant -i wlan0 -D wext -c /etc/wpa_supplicant/wpa_supplicant.conf
	$ dhclient wlan0

shortcut

	$ vim ~/.bashrc

add follow command in the end

	$ alias wifi='sudo wpa_supplicant -B -i wlp2s0 -D wext -c /etc/wpa_supplicant/wpa_supplicant.conf && sudo dhclient wlp2s0'

reload .bashrc

	$ source ~/.bashrc
	
### sample of config 

	update_config=1
	network={
		ssid="dddd"
		scan_ssid=1
		#psk="23456789"
		psk=9a2b010602a92b62fe766450f5c66ebb05171954f5282c288e898dbc0c6c63b7
		proto=RSN
		key_mgmt=WPA-PSK
		pairwise=CCMP
		auth_alg=OPEN
	}

