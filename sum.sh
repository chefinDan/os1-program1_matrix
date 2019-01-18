#!/bin/bash

sum=0
read myLine

echo $myLine
		
for i in $myLine
do
	echo "i: $i"
	sum=$(expr $sum + $i)
done

echo "Sum of numbers: $sum"
