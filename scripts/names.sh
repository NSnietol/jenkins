#!/bin/bash

USER=$1
PASS=$2
HOST=$3

source="/data/people.txt"

counter=0

while [ $counter -lt 50 ];
do
        let counter=counter+1
        name=$(nl $source | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $1}')
        lastname=$(nl $source| grep -w $counter | awk '{print $2}' | awk -F ',' '{print $2}')
        edad=$(shuf -i 20-50 -n 1)

        mysql -u $USER -h $HOST -p$PASS people -e "insert into registro values ($counter,'$name','$lastname',$edad)"
        echo "Ok, $name $lastname $edad"
        break

done
