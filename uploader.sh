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
   echo "INSERT INTO leaks (email, password, collection, type) VALUES " >> db.txt
   cat outaux.txt | awk -F  ":" '{printf "(\"%s\",\"%s\",\"Collection '#'1\",\"leak\"),\n", $1,$2}' >> db.txt
   sed -i '$s/,$//' db.txt
   echo ";" >> db.txt
   mysql -h XXXXX.XXXXX.us-east-1.rds.amazonaws.com -P 3306 -u XXXXX --database=RDS -p"XXXXXX" < db.txt
done
