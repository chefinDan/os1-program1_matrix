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

dims()
{
	[ "$#" -ne 1 ] && return 2

	matXDim=0
	matYDim=0
	while read M1_LINE
	do
		matYDim=$(expr $matYDim + 1)
		if [ $matYDim -eq 1 ]
		then

			for i in $M1_LINE
			do
				matXDim=$(expr $matXDim + 1)
			done
		fi

	done < $1

		printf "%s %s\n" "$matXDim" "$matYDim"
}

add()
{
	[ "$#" -ne  2 ] && return 2

	M1=0
	while read M1_LINE
	do
		echo $M1_LINE
		M1=${ $M1 + $M1_LINE }
	done < $1

	echo "M1: $M1"

}

# Beginning of script
# Check that there is at least 2 arguments passed at the command line
[ "$#" -lt  2 ] && echo "Invalid number of arguments for matrix script"

# Check that the files are valid
for i in ${@:2}
do
	if ! [ -f "$i" ]
	then
		echo "file: $i is not valid"
		exit 1
	fi
done

# call the function matching arg 1 and pass the rest of the args to the function
$1 ${@:2}

if [ -e .mat* ]
then
	rm .mat*
fi
# check the exit status of the last function
if [ $? -eq 2 ]
then
	echo "Invalid number of arguments for $1 function"
fi
