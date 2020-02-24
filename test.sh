#!/bin/bash

# str="abcde"
# n=3
# echo ${str:${#str} - $n}


line="someline content"
echo ${line}

lastchars=${line: -5:1}
echo ${lastchars}
