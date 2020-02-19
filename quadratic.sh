#!/bin/bash

echo

# Get numbers from command line
args=("$@")
a=${args[0]} 
b=${args[1]}
c=${args[2]}

#display the quadratic equation
echo $a"x^2 + " $b "x + " $c " = 0"
echo
# display Quadratic coefficients
echo "a : " $a
echo "b : " $b
echo "c : " $c
echo


# only real roots when discriminant is non negative
# discriminant is b^2 -4ac
discriminant=$(bc <<< "scale=10;$b*$b-4*$a*$c")

# if discriminant is non negative
if(( $(echo "$discriminant >= 0" |bc -l) ))
then
    # calculate root of discriminant 
    sroot=$(bc -l<<< "scale=10;sqrt($discriminant)")

    # + side of -b formula 
    # calculate top part of -b formula
    ans1_top=$(bc -l<<< "scale=10;- $b + $sroot")
    # divide top part of -b formula by the bottom part
    ans1=$(bc -l<<< "scale=2;$ans1_top / (2*$a)")


    # - side of -b formula 
    # calculate top part of -b formula
    ans2_top=$(bc -l<<< "scale=10; - $b - $sroot")
    # divide top part of -b formula by the bottom part
    ans2=$(bc -l<<< "scale=2;$ans2_top / (2*$a)")

    # display results
    echo "x1 = " $ans1  ";    x2 = " $ans2 ";"
else
    # if the quadratic has imaginary roots this message appears
    echo "The roots are not real"
fi


