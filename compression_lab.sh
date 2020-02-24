#!/bin/bash
echo

# read file from command line
args=("$@")
filename=${args[0]}

# Original file size
og_size=$(wc -c "$filename"  | awk '{print $1}')

# This script follows the following commands for each case
# Compression of the file
# Read the file size of the compressed file
# Calculate the compression rate compared to original rate. 

# ZIP compression. 
zip -q "$filename.zip" "$filename"
zip_size=$(wc -c "$filename.zip"  | awk '{print $1}')
zip_rate=$(bc -l<<< "scale=2;100 - $zip_size*100/$og_size")

# GZIP compression 
gzip -kf "$filename"
gzip_size=$(wc -c "$filename.gz"  | awk '{print $1}')
gzip_rate=$(bc -l<<< "scale=2;100 - $gzip_size*100/$og_size")

# BZIP2 compression
bzip2 -kf "$filename"
bzip2_size=$(wc -c "$filename.bz2"  | awk '{print $1}')
bzip2_rate=$(bc -l<<< "scale=2;100 - $bzip2_size*100/$og_size")

# XZ compression
xz -kf "$filename"
xz_size=$(wc -c "$filename.xz"  | awk '{print $1}')
xz_rate=$(bc -l<<< "scale=2;100 - $xz_size*100/$og_size")




# Report display
echo
echo "-----------------------------------------------"
echo "           Compression lab report              "
echo "-----------------------------------------------"
echo 
echo "File to be compressed: " $filename
echo
printf "\n%-10s | %-10s | %-10s\n" "Method" "Size" "Comp. Rate"
printf "%-10s | %-10s | %-10s\n" "⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻" "⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻" "⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻"

printf "%-10s | %-10s | %-10s" "Original" "$og_size" "0%"
printf "\n%-10s | %-10s | %-10s" "zip" "$zip_size"    "$zip_rate%"
printf "\n%-10s | %-10s | %-10s" "gzip" "$gzip_size"   "$gzip_rate"
printf "\n%-10s | %-10s | %-10s" "bzip2    " $bzip2_size  "$bzip2_rate"
printf "\n%-10s | %-10s | %-10s" "xz       " $xz_size     "$xz_rate"
echo
printf "%-10s   %-10s   %-10s\n" "⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻" "⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻" "⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻"