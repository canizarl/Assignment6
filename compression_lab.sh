#!/bin/bash
echo


args=("$@")
filename=${args[0]}
echo $filename


zip "$filename"