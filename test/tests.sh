#!/bin/bash

test1() {
	echo "Run script without arguments"
	./$1 > /dev/null
	return $?
}

test2() {
	echo "Run script with wrong argument"
	./$1 -t > /dev/null
	return $?
}

test3() {
	echo "Run the 1st link creation test"
	./$1 -l > /dev/null
	return $?
}

test4() {
	echo "Run the 2nd link creation test"
	./$1 -l target > /dev/null
	return $?
}

test5() {
	echo "Run the 3rd link creation test"
	./$1 --link > /dev/null
	return $?
}

test6() {
	echo "Run the 4th link creation test"
	./$1 -l target link > /dev/null
	return $?
}

test7() {
	echo "Run the 5th link creation test"
	./$1 -l target link > /dev/null
	return $?
}
