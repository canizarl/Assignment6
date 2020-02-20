#!/bin/bash

echo

# directory from command line
args=("$@")
a="${args[0]}"


# current working directory
cwd="$PWD"

# if no directory is given cwd is the default directory
# total paths and relative paths supported
if [[ "$a" == /* ]]
then 
    dir="$a"
else 
    dir="$cwd""/""$a"
fi


# Count total number of things in directory
totalnumber=$(ls -l "$dir"| wc -l)

#count number of bash files
number_of_sh=$(ls -l "$dir" | grep -c .sh)

#count number of directories
number_of_dir=$(ls -dl "$dir"/*/| wc -l)

#prints directory 
echo "$dir"

#display results
echo "Number of bash files: " $number_of_sh
echo "Number of directories: " $number_of_dir
echo "Number of other things: " $(($totalnumber-1-$number_of_sh-$number_of_dir))

echo