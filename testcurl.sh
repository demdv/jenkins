#!/bin/bash
Curlnginx=$(curl -I localhost | head -n 1 | cut -d$' ' -f2)
if [ $Curlnginx == 200 ]
then
	        echo 'exit 0'
fi

