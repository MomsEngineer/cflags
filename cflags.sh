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

case $1 in
	-l|--link)
		if (( 3 > $# )) || [[ ! -e $2 ]] || [[ -e $3 ]]; then
			echo "Some problems with link creation"
			exit 23
		fi
		ln -s $2 $3
	;;

	-r|--remove)
		if (( 2 > $# )) || [[ ! -f $2 ]]; then
			echo "Some problems with file removing"
			exit 24
		fi
		rm $2
	;;

	-f|--file)
		if (( 2 > $# )) || [[ -e $2 ]]; then
			echo "Some problems with file creation"
			exit 25
		fi
		touch $2
	;;

	-h|--help)
		echo "Help:"
		echo "    -h                 or --help   --> invoke help list"
		echo "    -l [target] [link] or --link   --> create a symbol link"
		echo "    -r [file]          or --remove --> remove a file"
		echo "    -f [file]          or --file   --> create a file"
		echo -e "\nExit codes: "
		echo "   23 --> Problem with link creation"
		echo "   24 --> Problem with file removing"
		echo "   25 --> Problem with file creation"
		echo "   26 --> Invalid parameters"
	;;

	*)
		echo "Wrong flag entered. There is no such flag ($1). Use -h or --help."
		exit 26
	;;
esac
