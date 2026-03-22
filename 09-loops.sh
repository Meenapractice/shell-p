#!/bin/bash

NUM=$1

if [ $NUM -gt 20 ]; then
   echo "$NUM is greater than 20"
elif [ $NUM -eq 20 ]; then
   echo "$NUM is equal to 20"
else
   echo "$NUM is less than 20"
fi