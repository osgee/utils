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

