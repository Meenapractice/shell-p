#!/bin/bash

echo "All arguments passed to script $@"
echo "Number of arguments passed to script $#"
echo "Name of the script $0"
echo "PID of the script $$"
echo "Present working directory $PWD"
echo "Home $HOME"
echo "Which user $USER"
echo "Which path $PATH"
sleep 10 &
echo "Last command that went in to backgorund $!"
echo "Last command status $?"