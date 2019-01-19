#!/bin/bash

sum()
{

	SUM=0
	while read myLine
	do
		echo $myLine

		for i in $myLine
		do
			echo "i: $i"
				sum=$(expr $sum + $i)
		done

	done < $1

		echo "Sum of numbers: $sum"
		return 0
}

# dispArgs()
# {
	# CNT=1
	# for i in $1 $2
	# do
		# echo "Param $CNT: $i"
		# CNT=$(expr $CNT + 1)
		# echo $@
		# echo "$1 ${@:2}"
		# sum $1
	# done
	# else
	# 	echo "Please provide an argument"
	# 	exit 1
	# fi
# }

add()
{
	[ "$#" -ne  3 ] && echo "Invalid number of arguments for add function" && exit -1
}

# Beginning of script
[ "$#" -lt  2 ] && echo "Invalid number of arguments" && exit -1
for i in ${@:2}
do
	if [ -f "$i" ]; then
		echo "$i is valid"
	else
		echo "file: $i is not valid"
		exit -2
	fi
done

$1 ${@:2}

if [ $? -ne 0 ]
then
	echo "$1 is not a recognized command"
fi
