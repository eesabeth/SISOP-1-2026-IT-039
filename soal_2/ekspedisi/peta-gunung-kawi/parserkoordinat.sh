#!/bin/bash

grep -E '"site_name"|"latitude"|"longitude"' gsxtrack.json \
| sed 's/[",]//g' \
| awk '
/site_name/ {name = $2}
/latitude/ {lati = $2}
/longitude/ {long = $2
		printf "node_%02d, %s, %s, %s\n", ++i, name,
		lati, long}' > titik-penting.txt
