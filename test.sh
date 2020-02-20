#!/bin/bash

echo

# directory from command line
args=("$@")
a="${args[0]}"


# current working directory
cwd="$PWD"

if [[ "$a" == /* ]]
then 
    dir="$a"
else 
    dir="$cwd""/""$a"
fi

totalnumber=$(ls -l "$dir"| wc -l)

if (( $(ls -l "$dir"| grep -c "$dir"/*.sh) == 0 ))
then
    echo "is equal to zero"
else
    echo "is not equal to zero"
fi

