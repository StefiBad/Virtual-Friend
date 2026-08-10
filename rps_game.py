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
    choices = ["Rock", "Paper", "Scissors"]
    typewrite("Welcome to Rock, Paper, Scissors! Let's get started!\n")

    while True:
        typewrite("Please, select a gun among Rock, Paper or Scissors:")
        typewrite("1. Rock\n2. Paper\n3. Scissors\n")

        while True:
            try:
                typewrite("And your gun is (1-3): ", end="")
                choice_idx = int(input())
                if 1 <= choice_idx <= 3:
                    break
                typewrite(
                    "This gun does not exist! Please choose between 1 and 3."
                )
            except ValueError:
                typewrite(
                    "Invalid input! Please enter a number (1, 2, or 3)."
                )

        player = choices[choice_idx - 1]
        computer = random.choice(choices)

        typewrite(f"\nYou selected: {player}")
        typewrite(f"The computer has selected: {computer}\n")

        if player == computer:
            typewrite("We got a tie! Try again!\n")
        elif (
            (player == "Rock" and computer == "Scissors")
            or (player == "Paper" and computer == "Rock")
            or (player == "Scissors" and computer == "Paper")
        ):
            typewrite("Congrats! You won!\n")
        else:
            typewrite("Oh, no! You lose the game!\n")

        typewrite("Would you like to play again?")
        typewrite("1. Yes\n2. No\n")

        while True:
            try:
                typewrite("Please, answer (1-2): ", end="")
                ans = int(input())
                if ans == 1:
                    typewrite("\nNice! Let's start the next round...\n")
                    break
                elif ans == 2:
                    typewrite("\nNo problem! Thanks for playing with me!")
                    return
                else:
                    typewrite("Invalid option! Please select 1 or 2.")
            except ValueError:
                typewrite("Invalid input! Please enter 1 or 2.")


play()