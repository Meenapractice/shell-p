#!/bin/bash

# In this script we will see how to pass the input in console dynamically through read 

echo "Please enter username:"
read USER_NAME

echo "Username is $USER_NAME"

echo "Please enter password:"
read -s PASSWORD # -s is to not print the entered text in console