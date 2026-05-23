#!/usr/bin/bash

#Name
name=$(cat username.txt)

#Menu
echo "Hi, $name! I'm your virtual friend. How can I help you today?"
echo "1. Calculator"
echo "2. Current date"
echo "3. Games"
echo "4. Exit"
echo ""
echo -n "Please, select an option (1-4): "
read option
echo $option
