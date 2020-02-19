#!/bin/bash

START=40000
END=42000

echo " "
echo "Diplay prime numbers between " $START " and " $END
echo " "
for((c=$START; c<=$END; c++))
do
    # Flag to see if number is prime
    f=0 
    
    # loops between 2 and half way through the number to see if it is divisible. 
    # if it is divisible by any number it gets flagged and loop breaks (no point on checking the rest)
    for((i=2; i<=($c/2);i++))
    do
        if(($c % $i == 0))
        then
            f=1
            break
        fi
    done

    # if flag remains as 0 then it is a prime number
    if(($f==0))
    then
        echo "Number : " $c    # prints result
    fi
done

echo " " 