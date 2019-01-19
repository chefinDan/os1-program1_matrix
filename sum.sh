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
		return
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

# dispArgs $1 $2
$1 ${@:2}
