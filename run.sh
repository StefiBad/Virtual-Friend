#!/usr/bin/bash

#Name
name=$(cat username.txt)

#Menu
<<<<<<< HEAD
menu="True"
echo "Hi, $name! I'm your virtual friend. How can I help you today?"
while [ "$menu" = "True" ]; do
echo "--MENU--"
echo "1. Calculator"
echo "2. Current date"
echo "3. Games"
echo "4. Exit"
echo ""
echo -n "Please, select an option (1-4): "
read option
<<<<<<< HEAD

case $option in
1) #Calculator
calc="True"
echo "Which operation symbol will you use?"
while [ "$calc" = "True" ]; do
echo "--CALCULATOR--"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Module"
echo "6. Exit"
echo ""
echo -n "Please, select an option (1-6): "
read symbol
case $symbol in
1) #Addition
echo -n "Alright $name, type two numbers: "
read num1 num2
echo "The result of adding $num1 and $num2 is $((num1 + num2))"
;;
2) #Subtraction
echo -n "Alright $name, type two numbers: "
read num1 num2
echo "The result of subtracting $num1 and $num2 is $((num1 - num2))"
;;
3) #Multiplication
echo -n "Alright $name, type two numbers: "
read num1 num2
echo "The result of multiplying $num1 and $num2 is $((num1 * num2))"
;;
4) #Division
echo -n "Alright $name, type two numbers: "
read num1 num2
echo "The result of dividing $num1 and $num2 is $((num1 / num2))"
;;
5) #Module
echo -n "Alright $name, type two numbers: "
read num1 num2
echo "The module of $num1 and $num2 is $((num1 % num2))"
;;
6) #Exit
echo "Calculator closed."
calc="False"
;;
*)
echo "Invalid option!"
;;
esac
done
;;
2) #Current date
echo "The current day is: $(date)"
;;
3) #Games
game="True"
echo "Ok, $name! What do you want to play?"
while [ "$game" = "True" ]; do
echo "--GAMES--"
echo "1. Guess the number"
echo "2. Rock, Paper, Scissors"
echo "3. Exit"
echo ""
echo -n "Choose a game: "
read option
case $option in
1) #Guess the number
python3 gtn_game.py
;;
2) #Rock, Paper, Scissors
echo "Comming soon..."
;;
3) #Exit
echo "Games closed"
game="False"
;;
*)
echo "Invalid option!"
;;
esac
done
;;
4) #Exit
echo "Bye! See you later!"
menu="False"
;;
*)
echo "Invalid option... Please, try again!"
;;
esac
done
