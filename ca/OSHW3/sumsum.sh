#!/bin/bash



function sum {
    k=0

    for number in $@
    do

    { k=$(expr $k + $number); } 2>/dev/null


    if [[ $? != 0 ]]
    then
        return 0
    fi

    done
    return $k
}
read x1 x2 x3
read y1 y2 y3

sum $x1 $x2 $x3
sumx=$?

sum $y1 $y2 $y3
sumy=$?


if [[ $sumx = $sumy ]]
then
    echo "Equal"
else
    echo "Not Equal"
fi



