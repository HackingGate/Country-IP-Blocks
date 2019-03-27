# Country-IP-Blocks
[![GitHub](https://img.shields.io/github/license/HackingGate/Country-IP-Blocks.svg)](https://github.com/HackingGate/Country-IP-Blocks/raw/master/LICENSE)
[![Build Status](https://travis-ci.org/HackingGate/Country-IP-Blocks.svg?branch=master)](https://travis-ci.org/HackingGate/Country-IP-Blocks)

Generate latest country IP ranges in CIDR notation

## How it works

The shell script `generate.sh` will download latest RIR statistics files ([RIR statistics exchange format](https://www.apnic.net/about-apnic/corporate-documents/documents/resource-guidelines/rir-statistics-exchange-format/)) form the following five Regional Internet Registries (RIRs).

[![rir-map.svg](https://www.iana.org/_img/2013.1/rir-map.svg)](https://www.iana.org/numbers)

URLs:

```sh
https://ftp.apnic.net/stats/apnic/delegated-apnic-latest
https://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest
https://ftp.ripe.net/ripe/stats/delegated-ripencc-latest
https://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest
https://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest
```

It then grab entries form files above. Generate `country_code.txt`. Convert IP ranges to CIDR notation. Generate IP files for each country.

### Example

Generate Japan IPv4 ranges from [APNIC](https://www.apnic.net) and save to `JP_IPv4.txt`.

```sh
curl -sL https://ftp.apnic.net/stats/apnic/delegated-apnic-latest | \
grep "apnic|JP|ipv4" | \
awk -F '|' '{ printf("%s/%d\n", $4, 32-log($5)/log(2)) }' | \
tee JP_IPv4.txt
```

## Usage

This will generate all countries and save IP files to your current directory.

```sh
curl -sL https://github.com/HackingGate/Country-IP-Blocks/raw/master/generate.sh | sh
```

Country code is under [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) standard.

## GitHub Pages

The following files are hosted on GitHub Pages.

- Mirror files of `delegated-*-latest`
- `country_code.txt`
- Country IP Block files

Available at [https://hackinggate.github.io/Country-IP-Blocks/](https://hackinggate.github.io/Country-IP-Blocks/)

and auto updates by [Travis CI](https://travis-ci.org) everyday.

## IP change history

Since this project use git.

You can view IP changes from [gh-pages branch](https://github.com/HackingGate/Country-IP-Blocks/tree/gh-pages).

Such as compare files between git commits to see when and what entries are added or deleted.
