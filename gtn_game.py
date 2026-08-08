import random


def play():
    print("Welcome to Guess the number! Let's get started!\n")
    levels = {1: 15, 2: 10, 3: 5}

    while True:
        print("Select your level of difficulty (1-3)")
        print("1. Easy (15 tries)")
        print("2. Medium (10 tries)")
        print("3. Hard (5 tries)\n")

        while True:
            try:
                level = int(input("And your level is: "))
                if level in levels:
                    tries = levels[level]
                    break
                print("This level doesn't exist! Please select 1, 2, or 3.")
            except ValueError:
                print("Invalid input! Please enter a number (1, 2, or 3).")

        computerNum = random.randint(1, 100)

        while tries > 0:
            try:
                playerNum = int(input("\nPlease, choose a number from 1 to 100: "))
                if not (1 <= playerNum <= 100):
                    print("You have inserted an invalid number. Try again!")
                    print("Remaining tries:", tries)
                    continue
            except ValueError:
                print("Invalid input! Please enter an integer from 1 to 100.")
                print("Remaining tries:", tries)
                continue

            if playerNum > computerNum:
                print("Your number is higher than the number to guess ;D")
                tries -= 1
                print("Remaining tries:", tries)
            elif playerNum < computerNum:
                print("Your number is lower than the number to guess ;D")
                tries -= 1
                print("Remaining tries:", tries)
            else:
                print("Congratulations! You won the game!!!")
                break

        if tries == 0:
            print("\nOh, no! You lose the game :(")
            print("The number to guess was:", computerNum)

        print("\nWould you like to play again?")
        print("1. Yes\n2. No\n")

        while True:
            try:
                answer = int(input("Please, answer (1-2): "))
                if answer == 1:
                    print("\nNice! Let's start the next round...\n")
                    break
                elif answer == 2:
                    print("\nNo problem! Thanks for playing with me!")
                    return
                else:
                    print("Invalid option! Please select 1 or 2.")
            except ValueError:
                print("Invalid input! Please enter 1 or 2.")


play()