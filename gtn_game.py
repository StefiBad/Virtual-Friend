import random
import sys
import time


def typewrite(text, end="\n"):
    for char in text:
        sys.stdout.write(char)
        sys.stdout.flush()
        time.sleep(0.03)
    sys.stdout.write(end)
    sys.stdout.flush()


def play():
    typewrite("Welcome to Guess the number! Let's get started!\n")
    levels = {1: 15, 2: 10, 3: 5}

    while True:
        typewrite("Select your level of difficulty (1-3)")
        typewrite("1. Easy (15 tries)")
        typewrite("2. Medium (10 tries)")
        typewrite("3. Hard (5 tries)\n")

        while True:
            try:
                typewrite("And your level is: ", end="")
                level = int(input())
                if level in levels:
                    tries = levels[level]
                    break
                typewrite("This level doesn't exist! Please select 1, 2, or 3.")
            except ValueError:
                typewrite(
                    "Invalid input! Please enter a number (1, 2, or 3)."
                )

        computerNum = random.randint(1, 100)

        while tries > 0:
            try:
                typewrite(
                    "\nPlease, choose a number from 1 to 100: ", end=""
                )
                playerNum = int(input())
                if not (1 <= playerNum <= 100):
                    typewrite(
                        "You have inserted an invalid number. Try again!"
                    )
                    typewrite(f"Remaining tries: {tries}")
                    continue
            except ValueError:
                typewrite(
                    "Invalid input! Please enter an integer from 1 to 100."
                )
                typewrite(f"Remaining tries: {tries}")
                continue

            if playerNum > computerNum:
                typewrite("Your number is higher than the number to guess ;D")
                tries -= 1
                typewrite(f"Remaining tries: {tries}")
            elif playerNum < computerNum:
                typewrite("Your number is lower than the number to guess ;D")
                tries -= 1
                typewrite(f"Remaining tries: {tries}")
            else:
                typewrite("Congratulations! You won the game!!!")
                break

        if tries == 0:
            typewrite("\nOh, no! You lose the game :(")
            typewrite(f"The number to guess was: {computerNum}")

        typewrite("\nWould you like to play again?")
        typewrite("1. Yes\n2. No\n")

        while True:
            try:
                typewrite("Please, answer (1-2): ", end="")
                answer = int(input())
                if answer == 1:
                    typewrite("\nNice! Let's start the next round...\n")
                    break
                elif answer == 2:
                    typewrite("\nNo problem! Thanks for playing with me!")
                    return
                else:
                    typewrite("Invalid option! Please select 1 or 2.")
            except ValueError:
                typewrite("Invalid input! Please enter 1 or 2.")


play()