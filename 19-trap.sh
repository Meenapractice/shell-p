#!/bin/bash

set -e
trap 'echo "There is an error in Line number $LINENO : $BASH_COMMAND"' ERR

echo "Hi How are you"
echo "I am fine"
echoo "THis line has error"
echo "This do not have error"