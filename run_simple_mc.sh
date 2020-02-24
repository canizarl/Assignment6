#!/bin/bash
clear
echo

#compiles program to make sure works on every machine
_=$(make simple_mc)



#if no argument is given then uses default of 10
#if argument is given then executes the program n number of times
# required argument -n followed by an integer. 
args=("$@")
if [ -z "$args" ]
then
      n=100   #default value
else
    str1=${args[0]}
    str2="-n"
    if [[ "$str1" == "$str2" ]]
    then
        n=args[1]
        # check n is a valid number
        if((n <= 0))
        then
            echo "ERROR n cannot be negative"
        fi

    else
        # display usage
        echo "usage: ./run_simple_mc [-n integer]"
    fi
fi

# count number of "y"
county=0
for((i=1; i<=n;i++))
do
    # run using a random seed
    output="$(./simple_mc $RANDOM )"
    
    # second last character in output string says if answer is correct or not
    yorn="${output: -2:1}"
    
    # count number of correct answers
    chary="y"
    if (($yorn ==  $chary))
    then
        let "county=county+1"
    fi
done

#calculate percentage
result=$(bc -l<<< "scale=2;(100*$county) / ($((n)))")
#display results
echo "simple_mc ran " $((n)) " times with " $result "% of correct answers"

# clean object files
_=$(make clean)


