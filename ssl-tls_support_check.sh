#!/usr/bin/env bash
# This script checks the encryption mechanism for a HTTPS site. I check the mechanism SSLv2 until TLSv1.3

echo -e "This script checks the encryption mechanism of a webserver which is supported \nI check the encryption SSLv2 until TLSv1.3"
read -p "Which HTTPS site do you want to check? Only Domain without https://[...]: " URL
ENC="--sslv2 --sslv3 --tlsv1.1 --tlsv1.2 --tlsv1.3"

for i in $ENC
do
	curl --output /dev/null -s $i $URL && echo "encryption mechanism $i is supported" || echo "encryption mechanism $i is not supported" && continue
done
