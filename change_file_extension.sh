#!/bin/bash
# replaces the file extension with the user supplied one
# usage: change_file_extension.sh filename extension

filename=${1:?Please enter the file name}
extension=${2:?Please enter the extension}
filenameonly=${filename%%.*}

mv ${filename} ${filenameonly}.${extension}

