#!/bin/bash

. thinking.sh
. tests.sh

TESTS=7

if (( 1 > $# )); then
	echo "The first argument must be the name of the test file"
	exit 1
fi

test_file=$1

for ((i = 1; i <= $TESTS; i++)); do
	tput setaf 3
	echo -n "Test $i: "
	tput setaf 7

	test$i $test_file
	res=$?
	
	thinking 40 0.07
	
	echo -n "Test result: "
	if (( 0 == $res )); then
		tput setaf 2
		echo "Done"
	else
		tput setaf 1
		echo "Fail"
	fi
	tput setaf 7 
done
