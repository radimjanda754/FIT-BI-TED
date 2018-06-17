#!/bin/bash
echo "DateTime	Temp" > gpTEMP
echo "DateTime	Fan" > gpFAN
echo "DateTime	Load" > gpLOAD
cat data_temp | cut -d " " -f4 > aaa1
cat data_temp.txt | tr "\t" " " | cut -d " " -f2 | tr "," "." > bbb1
cat bbb1 | awk -F" " '{print ($0+273.15);}' > ccc1
cat data_fan.txt | grep '.*:.*:.*' | cut -d " " -f4 > ddd1
cat data_fan.txt | grep 'speed' | tr "\t" " " | cut -d " " -f3 > ddd2
cat data_load.txt | grep 'load average' | tr -s " " | cut -d " " -f2 > eee1
cat data_load.txt | grep 'load average' | tr -s " " | cut -d " " -f9 | cut -d "," -f1,2 | tr -s "," "." > eee2
paste aaa1 ccc1 | awk '{if(NR%3==0)print;}' >> gpTEMP
paste ddd1 ddd2 | awk '{if(NR%3==0)print;}' >> gpFAN
paste eee1 eee2 | awk '{if(NR%3==0)print;}' >> gpLOAD
rm aaa1 bbb1 ccc1 ddd1 ddd2 eee1 eee2
