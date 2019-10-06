#!/bin/bash
/etc/init.d/smbd start
/etc/init.d/nmbd start
while [ 1 ];
do
	sleep 60
done
