Curlnginx=$(curl -I localhost | head -n 1 | cut -d$' ' -f2)
if [ $Curlnginx -eq 200 ]
then
	        echo '0'
fi

