#!/bin/bash
echo
MIN=1
MAX=45

# initialise the array
lotto_numbers=()

c=1
while [ $c -le 6 ]
do
    # generates random number between 0 and 44 and add 1 to make range between 1 and 45
    buff=$(( $RANDOM % 45 + 1))

    # check if random number is in the array
    check=$(echo ${lotto_numbers[@]} | grep -o "$buff" | wc -w)

    # if number is not in array then save it
    if((check == 0))
    then
        lotto_numbers[c]=$buff
        ((c++))
    fi
done


# lotto numbers are in ascending order (looks like it from what ive seen online, ive never played the lotto)
sorted=( $( printf "%s\n" "${lotto_numbers[@]}" | sort -n ) )
echo ${sorted[*]}
