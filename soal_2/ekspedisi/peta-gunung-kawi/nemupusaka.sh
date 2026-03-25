#!/bin/bash

lati1=$(awk -F',' 'NR == 1 {print $3}' titik-penting.txt)
long1=$(awk -F',' 'NR == 1 {print $4}' titik-penting.txt)

lati2=$(awk -F',' 'NR == 3 {print $3}' titik-penting.txt)
long2=$(awk -F',' 'NR == 3 {print $4}' titik-penting.txt)

mid_lati=$(echo "($lati1 + $lati2)/2" | bc -l)
mid_long=$(echo "($long1 + $long2)/2" | bc -l)

echo "$mid_lati, $mid_long" > posisipusaka.txt

echo "Koordinat pusaka:"
cat posisipusaka.txt
