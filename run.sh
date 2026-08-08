#!/usr/bin/bash

#Name
name=$(cat username.txt)

#Set username
if [ "$name" == "USERNAME" ]; then
    echo "Hello! It seems you haven't set your username yet."
    read -p "Do you want to set it now? (y/n): " reply
    if [ "$reply" == "y" ]; then
        read -p "Please, type your name: " name
        echo "$name" > username.txt
    else
        echo "Ok, you can set it later."
    fi
fi

#Set greeting
current_hour=$(date +%H)
if [ "$current_hour" -lt 12 ]; then
    greeting="Good morning"
elif [ "$current_hour" -lt 20 ]; then
    greeting="Good afternoon"
else
    greeting="Good evening"
fi

#Menu
menu="True"
echo "$greeting, $name! I'm your virtual friend. How can I help you today?"
while [ "$menu" = "True" ]; do
    echo "--MENU--"
    echo "1. Calculator"
    echo "2. Current date"
    echo "3. Games"
    echo "4. Change username"
    echo "5. Exit"
    echo ""
    echo -n "Please, select an option (1-5): "
    read option

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
                        if [ $num2 -eq 0 ]; then
                            echo "Hey! You cannot divide by zero"
                        else
                            echo "The result of dividing $num1 and $num2 is $((num1 / num2))"
                        fi
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
        4) #Change username
            read -p "Are you sure you want to change your username? (y/n): " reply
            if [ "$reply" == "y" ]; then
                read -p "Please, type your new name: " name
                echo "$name" > username.txt
                echo "Your username has been changed to $name."
            else
                echo "Ok, your username remains $name."
            fi
            ;;
        5) #Exit
            echo "Bye! See you later, $name!"
            menu="False"
            ;;
        *)
            echo "Invalid option... Please, try again!"
            ;;
    esac
done