import random

def play():
    choices = ["Rock", "Paper", "Scissors"]
    print("Welcome to Rock, Paper, Scissors! Let's get started!\n")

    while True:
        print("Please, select a gun among Rock, Paper or Scissors:")
        print("1. Rock\n2. Paper\n3. Scissors\n")

        while True:
            try:
                choice_idx = int(input("And your gun is (1-3): "))
                if 1 <= choice_idx <= 3:
                    break
                print("This gun does not exist! Please choose between 1 and 3.")
            except ValueError:
                print("Invalid input! Please enter a number (1, 2, or 3).")

        player = choices[choice_idx - 1]
        computer = random.choice(choices)

        print(f"\nYou selected: {player}")
        print(f"The computer has selected: {computer}\n")

        if player == computer:
            print("We got a tie! Try again!\n")
        elif (
            (player == "Rock" and computer == "Scissors") or
            (player == "Paper" and computer == "Rock") or
            (player == "Scissors" and computer == "Paper")
        ):
            print("Congrats! You won!\n")
        else:
            print("Oh, no! You lose the game!\n")

        print("Would you like to play again?")
        print("1. Yes\n2. No\n")

        while True:
            try:
                ans = int(input("Please, answer (1-2): "))
                if ans == 1:
                    print("\nNice! Let's start the next round...\n")
                    break
                elif ans == 2:
                    print("\nNo problem! Thanks for playing with me!")
                    return
                else:
                    print("Invalid option! Please select 1 or 2.")
            except ValueError:
                print("Invalid input! Please enter 1 or 2.")

play()