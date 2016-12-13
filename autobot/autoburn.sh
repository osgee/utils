#!/bin/bash

while true; do
	BURN_DIR=/Volumes/KINGSTON/
	echo 'detect '$BURN_DIR
	if [[ -d $BURN_DIR ]]; then
		echo 'detected '$BURN_DIR
		say start task
		echo 'formatting '$BURN_DIR' ...'
		diskutil eraseVolume UFSD_NTFS KINGSTON $BURN_DIR
		echo 'burning '$BURN_DIR' ...'
		cp -r ~/Desktop/duplicate/* $BURN_DIR
		echo 'unmounting '$BURN_DIR' ...'
		diskutil unmount $BURN_DIR
		sleep 3
		echo 'finished!'
		say task finished
	fi
	echo 'no '$BURN_DIR
	echo 'waiting 3s...'
	sleep 3
done


