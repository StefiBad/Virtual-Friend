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
    choices = ["Rock", "Paper", "Scissors"]
    typewrite(
        f"{CYAN}Welcome to Rock, Paper, Scissors! Let's get started!\n{RESET}"
    )

    while True:
        typewrite(
            f"{CYAN}Please, select a gun among Rock, Paper or Scissors:{RESET}"
        )
        typewrite("1. Rock\n2. Paper\n3. Scissors\n")

        while True:
            try:
                typewrite(f"{YELLOW}And your gun is (1-3): {RESET}", end="")
                choice_idx = int(input())
                if 1 <= choice_idx <= 3:
                    break
                typewrite(
                    f"{RED}This gun does not exist! Please choose between 1 and 3.{RESET}"
                )
            except ValueError:
                typewrite(
                    f"{RED}Invalid input! Please enter a number (1, 2, or 3).{RESET}"
                )

        player = choices[choice_idx - 1]
        computer = random.choice(choices)

        typewrite(f"\nYou selected: {PURPLE}{player}{RESET}")
        typewrite(f"The computer has selected: {PURPLE}{computer}{RESET}\n")

        if player == computer:
            typewrite(f"{YELLOW}We got a tie! Try again!\n{RESET}")
        elif (
            (player == "Rock" and computer == "Scissors")
            or (player == "Paper" and computer == "Rock")
            or (player == "Scissors" and computer == "Paper")
        ):
            typewrite(f"{GREEN}Congrats! You won!\n{RESET}")
        else:
            typewrite(f"{RED}Oh, no! You lose the game!\n{RESET}")

        typewrite(f"{YELLOW}Would you like to play again?{RESET}")
        typewrite("1. Yes\n2. No\n")

        while True:
            try:
                typewrite(f"{YELLOW}Please, answer (1-2): {RESET}", end="")
                ans = int(input())
                if ans == 1:
                    typewrite(
                        f"\n{GREEN}Nice! Let's start the next round...\n{RESET}"
                    )
                    break
                elif ans == 2:
                    typewrite("\nNo problem! Thanks for playing with me!")
                    return
                else:
                    typewrite(
                        f"{RED}Invalid option! Please select 1 or 2.{RESET}"
                    )
            except ValueError:
                typewrite(f"{RED}Invalid input! Please enter 1 or 2.{RESET}")


play()