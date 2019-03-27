# Country-IP-Blocks
[![GitHub](https://img.shields.io/github/license/HackingGate/Country-IP-Blocks.svg)](https://github.com/HackingGate/Country-IP-Blocks/raw/master/LICENSE)
[![Build Status](https://travis-ci.org/HackingGate/Country-IP-Blocks.svg?branch=master)](https://travis-ci.org/HackingGate/Country-IP-Blocks)

Generate latest country IP ranges in CIDR notation

## How it works

The shell script `generate.sh` will download latest data form the following five Regional Internet Registries (RIRs).

![rir-map.svg](https://www.iana.org/_img/2013.1/rir-map.svg)

URLs:

```sh
https://ftp.apnic.net/stats/apnic/delegated-apnic-latest
https://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest
https://ftp.ripe.net/ripe/stats/delegated-ripencc-latest
https://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest
https://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest
```

Then it will generate IP ranges in CIDR notation for each country and save it as a txt file. 

Learn more from [RIR statistics exchange format](https://www.apnic.net/about-apnic/corporate-documents/documents/resource-guidelines/rir-statistics-exchange-format/).

## Usage

This will generate and save files to your current directory.

```sh
curl -sL https://github.com/HackingGate/Country-IP-Blocks/raw/master/generate.sh | sh
```

## GitHub Pages

The following files

- Mirror files of `delegated-*-latest`
- `country_code.txt`
- Country IP Block files

are hosted on: 

[https://hackinggate.github.io/Country-IP-Blocks/index.html](https://hackinggate.github.io/Country-IP-Blocks/index.html)

and auto updated by [Travis CI](https://travis-ci.org).

