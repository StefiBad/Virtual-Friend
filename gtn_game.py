import random

print("Welcome to Guess the number! Let's get started!")
play = True
while play == True:
  print("Select your level of difficulty (1-3)")
  print("1. Easy (15 tries)")
  print("2. Medium (10 tries)")
  print("3. Hard (5 tries)")
  print("")
  asklev = False
  level = int(input("And your level is: "))
  while asklev == False:
    if level == 1:
      tries = 15
      asklev = True
    elif level == 2:
      tries = 10
      asklev = True
    elif level == 3:
      tries = 5
      asklev = True
    else:
      print("This level doesn't exist!")
      level = int(input("So your level is: "))
  computerNum = random.randint(1, 100)
  while tries > 0:
    playerNum = int(input("Please, choose a number from 1 to 100: "))
    if playerNum <= 100 and playerNum > computerNum:
      print("Your number is higher than the number to guess ;D")
      tries -= 1
      print("Remaining tries:", tries)
    elif playerNum >= 1 and playerNum < computerNum:
      print("Your number is lower than the number to guess ;D")
      tries -= 1
      print("Remaining tries:", tries)
    elif playerNum == computerNum:
      print("Congratulations! You won the game!!!")
      tries = -1
    else:
      print("You have inserted an invalid number. Try again!")
      print("Remaining tries:", tries)
  if tries == 0:
    print("Oh, no! You lose the game :(")
  askgame = False
  while askgame == False:
    print("Would you like to play again?")
    print("1. Yes")
    print("2. No")
    print("")
    answer = int(input("Please, answer (1-2): "))
    if answer == 1:
      print("Nice! Let's start the next round...")
      askgame = True
    elif answer == 2:
      print("No problem! Thanks for playing with me!")
      askgame = True
      play = False
    else:
      print("Invalid option!")
