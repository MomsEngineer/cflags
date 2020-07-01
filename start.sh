#!/bin/bash

. tests.sh

for (( i = 1; i <= 18; ++i )); do
	echo -n "Test $i: "
	test$i "cflags.sh"
done
