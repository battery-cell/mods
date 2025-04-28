#!/bin/bash

# loop over all PNG files in the current directory and its subdirectories
find . -name "*.png" -print0 | while read -d $'\0' file; do
  echo "Optimizing $file"

  # optimize the PNG file using ImageMagick's convert command
  convert "$file" -strip -define png:compression-level=9 -define png:compression-strategy=2 -define png:exclude-chunk=all "${file%.png}-optimized.png"

  # replace the original file with the optimized file
  mv "${file%.png}-optimized.png" "$file"
done
