#!/bin/bash

echo
args=("$@")
a=${args[0]} 
b=${args[1]}
c=${args[2]}


echo "a : " $a
echo "b : " $b
echo "c : " $c

discriminant=$(bc <<< "scale=2;$b*$b-4*$a*$c")
sroot=$(bc <<<"scale=2;sqrt($discriminant)")

echo $discriminant
echo $sroot
