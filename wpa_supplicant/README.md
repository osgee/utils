#wpa_supplicant
	$ wpa_passphrase SSID PASS > ~/wpa_pass.conf
	$ wpa_supplicant -i wlan0 -D wext -c /etc/wpa_supplicant/wpa_supplicant.conf
	$ dhclient wlan0
