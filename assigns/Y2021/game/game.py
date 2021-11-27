# -*- coding: utf-8 -*-
"""

You are given the program, which is NOT working properly. The program has bugs.
You are required to re-design this program to allow the following to happen:
   1. Allow this program to run more than once, this means that after each time the game ended, 
      the player will be prompted again if he wishes to play the game again
   2. The player has a choice to choose the opponent to be computer or player 2 
   3. If the opponent chosen is a computer, the player may choose to start the game first. 
      If the computer is to start the game first,
      you are required to devise the algorithm to ensure a 'sure win' for the computer,
      otherwise, attempt to secure a winning at the end
   4. You are required to write meaningful functions to support the various scenarios here

"""

'''
You are required to replace the codes below with your own codes
'''
sticks = 21

print ("There are 21 sticks, you can take 1-3 number of sticks at a time.")

print ("Whoever take the last stick will win")

while True:
    print ("Sticks left: " , sticks)
    sticks_taken = int(input("Take sticks(1-3):"))
    if sticks == 1:
        print ("You took the last stick, you lose")
        break
    if sticks_taken >= 3 or sticks_taken <= 0:
        print ("Wrong choice")
        continue
    print ("Computer took: " , (5 - sticks_taken) , "n\n")
    sticks -= 5
    
'''
Testing output:
    Please paste your testing outputs as below :

A) 2 players playing with player 1 wins

B) 2 players playing with player 2 wins

C) Player with computer, computer starts first

D) Player with computer, player starts first



'''