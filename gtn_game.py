import random
import sys
import time

#Colors
CYAN = "\033[0;36m"
YELLOW = "\033[1;33m"
GREEN = "\033[0;32m"
RED = "\033[0;31m"
PURPLE = "\033[0;35m"
RESET = "\033[0m"


#Writing effect
def typewrite(text, end="\n"):
    for char in text:
        sys.stdout.write(char)
        sys.stdout.flush()
        time.sleep(0.03)
    sys.stdout.write(end)
    sys.stdout.flush()


def play():
    typewrite(f"{CYAN}Welcome to Guess the number! Let's get started!\n{RESET}")
    levels = {1: 15, 2: 10, 3: 5}

    while True:
        typewrite(f"{CYAN}Select your level of difficulty (1-3){RESET}")
        typewrite("1. Easy (15 tries)")
        typewrite("2. Medium (10 tries)")
        typewrite("3. Hard (5 tries)\n")

        while True:
            try:
                typewrite(f"{YELLOW}And your level is: {RESET}", end="")
                level = int(input())
                if level in levels:
                    tries = levels[level]
                    break
                typewrite(
                    f"{RED}This level doesn't exist! Please select 1, 2, or 3.{RESET}"
                )
            except ValueError:
                typewrite(
                    f"{RED}Invalid input! Please enter a number (1, 2, or 3).{RESET}"
                )

        computerNum = random.randint(1, 100)

        while tries > 0:
            try:
                typewrite(
                    f"\n{YELLOW}Please, choose a number from 1 to 100: {RESET}",
                    end="",
                )
                playerNum = int(input())
                if not (1 <= playerNum <= 100):
                    typewrite(
                        f"{RED}You have inserted an invalid number. Try again!{RESET}"
                    )
                    typewrite(f"Remaining tries: {tries}")
                    continue
            except ValueError:
                typewrite(
                    f"{RED}Invalid input! Please enter an integer from 1 to 100.{RESET}"
                )
                typewrite(f"Remaining tries: {tries}")
                continue

            if playerNum > computerNum:
                typewrite(
                    f"{YELLOW}Your number is higher than the number to guess ;D{RESET}"
                )
                tries -= 1
                typewrite(f"Remaining tries: {tries}")
            elif playerNum < computerNum:
                typewrite(
                    f"{YELLOW}Your number is lower than the number to guess ;D{RESET}"
                )
                tries -= 1
                typewrite(f"Remaining tries: {tries}")
            else:
                typewrite(f"{GREEN}Congratulations! You won the game!!!{RESET}")
                break

        if tries == 0:
            typewrite(f"\n{RED}Oh, no! You lose the game :({RESET}")
            typewrite(f"The number to guess was: {computerNum}")

        typewrite(f"\n{YELLOW}Would you like to play again?{RESET}")
        typewrite("1. Yes\n2. No\n")

        while True:
            try:
                typewrite(f"{YELLOW}Please, answer (1-2): {RESET}", end="")
                answer = int(input())
                if answer == 1:
                    typewrite(
                        f"\n{GREEN}Nice! Let's start the next round...\n{RESET}"
                    )
                    break
                elif answer == 2:
                    typewrite("\nNo problem! Thanks for playing with me!")
                    return
                else:
                    typewrite(
                        f"{RED}Invalid option! Please select 1 or 2.{RESET}"
                    )
            except ValueError:
                typewrite(f"{RED}Invalid input! Please enter 1 or 2.{RESET}")


play()