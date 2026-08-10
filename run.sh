#!/usr/bin/bash

#Writing effect
#Writing effect
typewrite() {
    newline=true
    if [ "$1" == "-n" ]; then
        newline=false
        shift
    fi

    text="$1"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep 0.03
    done

    if [ "$newline" = true ]; then
        echo ""
    fi
}

#Name
name=$(cat username.txt)

#Set username
if [ "$name" == "USERNAME" ]; then
    typewrite "Hello! It seems you haven't set your username yet."
    typewrite -n "Do you want to set it now? (y/n): "
    read reply
    if [ "$reply" == "y" ]; then
        typewrite -n "Please, type your name: "
        read name
        echo "$name" > username.txt
    else
        typewrite "Ok, you can set it later."
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
typewrite "$greeting, $name! I'm your virtual friend. How can I help you today?"
while [ "$menu" = "True" ]; do
    typewrite "--MENU--"
    typewrite "1. Calculator"
    typewrite "2. Current date"
    typewrite "3. Games"
    typewrite "4. Change username"
    typewrite "5. Exit"
    typewrite ""
    typewrite -n "Please, select an option (1-5): "
    read option

    case $option in
        1) #Calculator
            calc="True"
            typewrite "Which operation symbol will you use?"
            while [ "$calc" = "True" ]; do
                typewrite "--CALCULATOR--"
                typewrite "1. Addition"
                typewrite "2. Subtraction"
                typewrite "3. Multiplication"
                typewrite "4. Division"
                typewrite "5. Module"
                typewrite "6. Exit"
                typewrite ""
                typewrite -n "Please, select an option (1-6): "
                read symbol

                case $symbol in
                    1) #Addition
                        typewrite -n "Alright $name, type two numbers: "
                        read num1 num2
                        typewrite "The result of adding $num1 and $num2 is $((num1 + num2))"
                        ;;
                    2) #Subtraction
                        typewrite -n "Alright $name, type two numbers: "
                        read num1 num2
                        typewrite "The result of subtracting $num1 and $num2 is $((num1 - num2))"
                        ;;
                    3) #Multiplication
                        typewrite -n "Alright $name, type two numbers: "
                        read num1 num2
                        typewrite "The result of multiplying $num1 and $num2 is $((num1 * num2))"
                        ;;
                    4) #Division
                        typewrite -n "Alright $name, type two numbers: "
                        read num1 num2
                        if [ $num2 -eq 0 ]; then
                            typewrite "Hey! You cannot divide by zero"
                        else
                            typewrite "The result of dividing $num1 and $num2 is $((num1 / num2))"
                        fi
                        ;;
                    5) #Module
                        typewrite -n "Alright $name, type two numbers: "
                        read num1 num2
                        typewrite "The module of $num1 and $num2 is $((num1 % num2))"
                        ;;
                    6) #Exit
                        typewrite "Calculator closed."
                        calc="False"
                        ;;
                    *)
                        typewrite "Invalid option!"
                        ;;
                esac
            done
            ;;
        2) #Current date
            typewrite "The current day is: $(date)"
            ;;
        3) #Games
            game="True"
            typewrite "Ok, $name! What do you want to play?"
            while [ "$game" = "True" ]; do
                typewrite "--GAMES--"
                typewrite "1. Guess the number"
                typewrite "2. Rock, Paper, Scissors"
                typewrite "3. Exit"
                typewrite ""
                typewrite -n "Choose a game: "
                read option

                case $option in
                    1) #Guess the number
                        python3 gtn_game.py
                        ;;
                    2) #Rock, Paper, Scissors
                        python3 rps_game.py
                        ;;
                    3) #Exit
                        typewrite "Games closed"
                        game="False"
                        ;;
                    *)
                        typewrite "Invalid option!"
                        ;;
                esac
            done
            ;;
        4) #Change username
            typewrite -n "Are you sure you want to change your username? (y/n): "
            read reply
            if [ "$reply" == "y" ]; then
                typewrite -n "Please, type your new name: "
                read name
                echo "$name" > username.txt
                typewrite "Your username has been changed to $name."
            else
                typewrite "Ok, your username remains $name."
            fi
            ;;
        5) #Exit
            typewrite "Bye! See you later, $name!"
            menu="False"
            ;;
        *)
            typewrite "Invalid option... Please, try again!"
            ;;
    esac
done