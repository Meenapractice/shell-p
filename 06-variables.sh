#!/bin/bash

# this script is to see how we can pass the command o/p as input to variable

START_TIME=$(date +%s)

echo "Start time is $START_TIME"

sleep 10

END_TIME=$(date +%s)

echo "End time is $END_TIME"

TOTAL_TIME=$(($END_TIME - $START_TIME))

echo "Total time for the script to execute is $TOTAL_TIME"