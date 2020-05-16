#!/bin/bash

<< --Comment--
./test -l/--link target link
	create a slink with name from $3 to file with name from $2 

./test -r/--remove file
	remove a file with name from $2

./test -f/--file file
	create a file with name from $2

./test -h/--help
	Help:
		-h                 or --help   --> invoke help list
		-l [target] [link] or --link   --> create a symbol link
		-r [file]          or --remove --> remove a file
		-f [file]          or --file   --> create a file
--Comment--

if (( 1 > $# )); then
	echo "Too few arguments"
	exit 0
fi

case $1 in
	# Create a symbol link
	-l|--link)
		if (( 3 > $# )) || [[ ! -e $2 ]] || [[ -e $3 ]]; then
			echo "Some problems with link creation"
			exit 0
		fi
		ln -s $2 $3
	;;

	# Remove a file
	-r|--remove)
		if (( 2 > $# )) || [[ ! -f $2 ]]; then
			echo "Some problems with link creation"
			exit 0
		fi
		rm $2
	;;

	# Create a file
	-f|--file)
		if (( 2 > $# )) || [[ -e $2 ]]; then
			echo "Some problems with link creation"
			exit 0
		fi
	;;
	*)
		echo "Wrong flag entered. There is no such flag ($1)"
		exit 0
	;;
esac
