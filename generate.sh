#!/bin/sh

# Exit immediately if a simple command exits with a non-zero status
set -e

# Download data from registries 
wget -nv https://ftp.apnic.net/stats/apnic/delegated-apnic-latest -O delegated-apnic-latest.txt
wget -nv https://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest -O delegated-arin-extended-latest.txt
wget -nv https://ftp.ripe.net/ripe/stats/delegated-ripencc-latest -O delegated-ripencc-latest.txt
wget -nv https://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest -O delegated-afrinic-latest.txt
wget -nv https://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest -O delegated-lacnic-latest.txt

# Generate country codes
awk -F '|' '{ print $2 }' delegated-*-latest.txt | sort | uniq | grep -E '[A-Z]{2}' > country_code.txt

# Generate country ip blocks
while read cc; do
    grep "$cc|ipv4|" delegated-*-latest.txt | awk -F '|' '{ printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > ${cc}_IPv4.txt
    grep "$cc|ipv6|" delegated-*-latest.txt | awk -F '|' '{ printf("%s/%d\n", $4, $5) }' > ${cc}_IPv6.txt
done < country_code.txt
