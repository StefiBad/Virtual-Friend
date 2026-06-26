import random

print("Welcome to Rock, Paper, Scissors! Let's get started!")
play = True
while play == True:
  computerGun = random.choice(guns["Rock", "Paper", "Scissors"])
  print("Please, select a gun among Rock, Paper or Scissors (1-3)")
  print("1. Rock")
  print("2. Paper")
  print("3. Scissors")
  print("")
  askgun = False
  playerGun = int(input("And your gun is: ")
  while askgun == False:
    if playerGun < 1 or playerGun > 3:
      print("This gun does not exist!")
      playerGun = int(input(print("So your gun is: "))
    else:
      askgun = True
