#!/bin/bash 
 
# Check parameters 
if [[ "$#" -ne 3 ]]; then 
    echo "3 parameters required" 
    exit 0 
fi 
 
# Translate lesson name into correct name for Workshopper projects 
if [ $2 == "buffer_from_string" ]; then 
    STR="Buffer From String" 
elif [ $2 == "hexadecimal_encoding" ]; then 
    STR="Hexadecimal Encoding" 
elif [ $2 == "modifying_buffers" ]; then 
    STR="Modifying Buffers" 
elif [ $2 == "line_splitter" ]; then 
    STR="Line Splitter" 
elif [ $2 == "buffer_concat" ]; then 
    STR="Buffer Concat" 
elif [ $2 == "typed_arrays" ]; then 
    STR="Typed Arrays" 
elif [ $2 == "array_buffers" ]; then 
    STR="Array Buffers" 
else 
    echo UNKNOWN: Make sure you have your code file selected before running/verifying 
    exit 0 
fi 
echo SELECTED FILE IS : $STR 
 
#Select the workshopper lesson 
bytewiser select $STR > /dev/null 
 
# Run or Verify? 
if [ $1 == "run" ]; then 
    bytewiser run $3/$2.js 
elif [ $1 == "verify" ]; then 
    bytewiser verify $3/$2.js 
else  
    echo "BAD COMMAND" 
fi