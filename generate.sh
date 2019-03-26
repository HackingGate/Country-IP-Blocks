#!/bin/sh

# Download data from registries 
wget https://ftp.apnic.net/stats/apnic/delegated-apnic-latest -O delegated-apnic-latest
wget https://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest -O delegated-arin-extended-latest
wget https://ftp.ripe.net/ripe/stats/delegated-ripencc-latest -O delegated-ripencc-latest
wget https://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest -O delegated-afrinic-latest
wget https://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest -O delegated-lacnic-latest

# Generate country codes
awk -F '|' '{ print $2 }' delegated-*-latest | sort | uniq | grep -E '[A-Z]{2}' > country_code

# Generate country ip blocks
while read cc; do
    grep "$cc|ipv4|" delegated-*-latest | awk -F '|' '{ printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > ${cc}_IPv4
    grep "$cc|ipv6|" delegated-*-latest | awk -F '|' '{ printf("%s/%d\n", $4, $5) }' > ${cc}_IPv6
done <country_code
