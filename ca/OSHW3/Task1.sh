#!/bin/bash

#read returns the number of read bytes. In case of mistake: -1

echo -n "Enter your name: "
read var1
if [[ $var1 = '' ]]
then
    echo "Hello, $(whoami)"
else
    echo "Hello, $var1"
fi
