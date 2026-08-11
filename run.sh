#!/usr/bin/bash

#Colors
CYAN=$'\033[0;36m'
YELLOW=$'\033[1;33m'
GREEN=$'\033[0;32m'
RED=$'\033[0;31m'
PURPLE=$'\033[0;35m'
RESET=$'\033[0m'

#Writing effect
typewrite() {
    newline=true
    if [ "$1" == "-n" ]; then
        newline=false
        shift
    fi

    text="$1"
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${text:$i:1}"
        sleep 0.03
    done

    if [ "$newline" = true ]; then
        echo -e ""
    fi
}

#Name
name=$(cat username.txt)

#Set username
if [ "$name" == "USERNAME" ]; then
    typewrite "${CYAN}Hello! It seems you haven't set your username yet.${RESET}"
    typewrite -n "${YELLOW}Do you want to set it now? (y/n): ${RESET}"
    read reply
    if [ "$reply" == "y" ]; then
        typewrite -n "${YELLOW}Please, type your name: ${RESET}"
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
typewrite "${CYAN}$greeting, ${PURPLE}$name${CYAN}! I'm your virtual friend. How can I help you today?${RESET}"
while [ "$menu" = "True" ]; do
    typewrite "${CYAN}--MENU--${RESET}"
    typewrite "1. Calculator"
    typewrite "2. Current date"
    typewrite "3. Games"
    typewrite "4. Change username"
    typewrite "5. Exit"
    typewrite ""
    typewrite -n "${YELLOW}Please, select an option (1-5): ${RESET}"
    read option

    case $option in
        1) #Calculator
            calc="True"
            typewrite "${YELLOW}Which operation symbol will you use?${RESET}"
            while [ "$calc" = "True" ]; do
                typewrite "${CYAN}--CALCULATOR--${RESET}"
                typewrite "1. Addition"
                typewrite "2. Subtraction"
                typewrite "3. Multiplication"
                typewrite "4. Division"
                typewrite "5. Module"
                typewrite "6. Exit"
                typewrite ""
                typewrite -n "${YELLOW}Please, select an option (1-6): ${RESET}"
                read symbol

                case $symbol in
                    1) #Addition
                        typewrite -n "${YELLOW}Alright ${PURPLE}$name${YELLOW}, type two numbers: ${RESET}"
                        read num1 num2
                        typewrite "${GREEN}The result of adding $num1 and $num2 is $((num1 + num2))${RESET}"
                        ;;
                    2) #Subtraction
                        typewrite -n "${YELLOW}Alright ${PURPLE}$name${YELLOW}, type two numbers: ${RESET}"
                        read num1 num2
                        typewrite "${GREEN}The result of subtracting $num1 and $num2 is $((num1 - num2))${RESET}"
                        ;;
                    3) #Multiplication
                        typewrite -n "${YELLOW}Alright ${PURPLE}$name${YELLOW}, type two numbers: ${RESET}"
                        read num1 num2
                        typewrite "${GREEN}The result of multiplying $num1 and $num2 is $((num1 * num2))${RESET}"
                        ;;
                    4) #Division
                        typewrite -n "${YELLOW}Alright ${PURPLE}$name${YELLOW}, type two numbers: ${RESET}"
                        read num1 num2
                        if [ $num2 -eq 0 ]; then
                            typewrite "${RED}Hey! You cannot divide by zero${RESET}"
                        else
                            typewrite "${GREEN}The result of dividing $num1 and $num2 is $((num1 / num2))${RESET}"
                        fi
                        ;;
                    5) #Module
                        typewrite -n "${YELLOW}Alright ${PURPLE}$name${YELLOW}, type two numbers: ${RESET}"
                        read num1 num2
                        typewrite "${GREEN}The module of $num1 and $num2 is $((num1 % num2))${RESET}"
                        ;;
                    6) #Exit
                        typewrite "Calculator closed."
                        calc="False"
                        ;;
                    *)
                        typewrite "${RED}Invalid option!${RESET}"
                        ;;
                esac
            done
            ;;
        2) #Current date
            typewrite "${GREEN}The current date is: ${PURPLE}$(date +"%B %d, %Y - %I:%M %p") ${GREEN}Have a nice day, ${PURPLE}$name${GREEN}!${RESET}"
            ;;
        3) #Games
            game="True"
            typewrite "Ok, ${PURPLE}$name${RESET}! What do you want to play?"
            while [ "$game" = "True" ]; do
                typewrite "${CYAN}--GAMES--${RESET}"
                typewrite "1. Guess the number"
                typewrite "2. Rock, Paper, Scissors"
                typewrite "3. Exit"
                typewrite ""
                typewrite -n "${YELLOW}Choose a game: ${RESET}"
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
                        typewrite "${RED}Invalid option!${RESET}"
                        ;;
                esac
            done
            ;;
        4) #Change username
            typewrite -n "${YELLOW}Are you sure you want to change your username? (y/n): ${RESET}"
            read reply
            if [ "$reply" == "y" ]; then
                typewrite -n "${YELLOW}Please, type your new name: ${RESET}"
                read name
                echo "$name" > username.txt
                typewrite "${GREEN}Your username has been changed to ${PURPLE}$name${GREEN}.${RESET}"
            else
                typewrite "Ok, your username remains ${PURPLE}$name${RESET}."
            fi
            ;;
        5) #Exit
            typewrite "${CYAN}Bye! See you later, ${PURPLE}$name${CYAN}!${RESET}"
            menu="False"
            ;;
        *)
            typewrite "${RED}Invalid option... Please, try again!${RESET}"
            ;;
    esac
done