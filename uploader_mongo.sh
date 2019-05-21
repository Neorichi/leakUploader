#!/bin/bash
for i in {1..1}
do
   echo "File #$i"
   rm -f db.txt
   rm -f outaux.txt
   sed 's/"/[0x22]/g' "$i.txt" >> outaux.txt
   sed -i "s/'/[0x27]/g" outaux.txt
   sed -i "s/\//[0x26]/g" outaux.txt
   sed -i 's/\\/[0x25]/g' outaux.txt
   echo "[" >> db.txt
   cat outaux.txt | awk -F  ":" '{printf " {\"email\": \"%s\", \"password\": \"%s\", \"collection\": \"Collection '#'1\", \"type\": \"leak\"},\n", $1,$2}' >> db.txt
   sed -i '$s/,$//' db.txt
   echo "]" >> db.txt
   #mongoimport --host localhost --username --password  --jsonArray --db leaks --collection leaks --file db.txt
   mongoimport --host localhost --jsonArray --db leaks --collection leaks --file db.txt
   #mongo db.leaks.find()
done
