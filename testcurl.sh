#!/bin/bash
Curlnginx=$(curl -I localhost | head -n 1 | cut -d$' ' -f2)
if [ $Curlnginx == 200 ]
then
	        echo '0'
fi

