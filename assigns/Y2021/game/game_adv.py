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




def main():




    is_continue = 0
    while True:

        print("**********************Game**************************")
        is_continue = input("Are you continue or exit,0: continue, 1: exit > ")
        if int(is_continue) == 1:
            print("Exit! Bye!")
            exit(0)
        else:
            if int(is_continue) not in (0,1):
                print("Wrong continue! Re-input!")
                is_continue=input("Are you continue or exit,0: continue, 1: exit > ")
        component = input("Choose your opponent,1: computer, 2: player 2 > ")
        while int(component) not in (1, 2):
            print("Wrong component! Re-input!")
            component = input("Choose your opponent,1: computer, 2: player 2 > ")
        print("There are 21 sticks, you can take 1-3 number of sticks at a time.")
        print("Whoever take the last stick will win")
        if int(component)==1:
            computer_first=input("the computer is opponent,please choose which first: 1:computer, 2: you > ")
            while int(computer_first) not in (1,2):
                print("Wrong sequence! Re-input!")
                computer_first = input("the computer is opponent,please choose which first: 1:computer, 2: you > ")
        elif int(component)==2:
            pass
        print("-------------------welcome game!--------------------")
        if int(component)==1:
            if int(computer_first) == 1:
                play_sticks_computer_first(sticks)
            elif int(computer_first) == 2:
                play_sticks_with_computer(sticks)
        elif int(component)==2:
            play_sticks_with_player(sticks)


def play_sticks_with_player(sticks):
    while True:
        print("Sticks left: ", sticks)
        player_1_taken=int(input("Player1 Take sticks(1-3):"))
        while player_1_taken>3 or player_1_taken<=0:
            print("Wrong choice, Re-input!")
            player_1_taken=int(input("Player1 Take sticks(1-3):"))

        sticks-=player_1_taken
        if sticks==1:
            print("Player2 took the last stick, Player 2 lose, Player 1 win!")
            break
        elif sticks<=0:
            print("Player1 took the last stick, Player 1 lose, Player 2 win!")
            break
        player_2_taken = int(input("Player2 Take sticks(1-3):"))
        while player_2_taken>3 or player_2_taken<=0:
            print("Wrong choice, Re-input!")
            player_2_taken=int(input("Player2 Take sticks(1-3):"))
        sticks-=player_2_taken
        if sticks==1:
            print("Player1 took the last stick, Player 1 lose, Player 2 win!")
            break
        elif sticks<=0:
            print("Player2 took the last stick, Player 2 lose, Player 1 win!")

    pass
def play_sticks_computer_first(sticks):
    computer_sticks = 1
    round=1

    while True:
        print("Sticks left: ", sticks)
        if round == 1:
            computer_sticks = 3
        elif round == 2:
            computer_sticks = 5 - last_sticks_taken
        else:
            computer_sticks = 4 - last_sticks_taken
        print("Computer took: ", computer_sticks)
        sticks-=computer_sticks
        if sticks==1:
            print("Sticks left: ", sticks)
            print("There is only one stick left! You took the last stick, you lose")
            break
        sticks_taken=int(input("Take sticks(1-3):"))
        if sticks_taken > 3 or sticks_taken <= 0:
            print("Wrong choice")
            sticks+=computer_sticks
            continue
        sticks-=sticks_taken
        last_sticks_taken=sticks_taken
        round+=1

def play_sticks_with_computer(sticks):
    while True:
        print("Sticks left: ", sticks)
        sticks_taken = int(input("Take sticks(1-3):"))
        if sticks == 1:
            print("You took the last stick, you lose")
            break
        if sticks_taken > 3 or sticks_taken <= 0:
            print("Wrong choice")
            continue
        print("Computer took: ", (3 - sticks_taken))
        sticks -= 3
        if sticks==0:
            print("Computer took the last stick, Computer lose")
            break

if __name__ == "__main__":
    main()


'''
Testing output:
    Please paste your testing outputs as below :

A) 2 players playing with player 1 wins
**********************Game**************************
Are you continue or exit,0: continue, 1: exit > 0
Choose your opponent,1: computer, 2: player 2 > 2
There are 21 sticks, you can take 1-3 number of sticks at a time.
Whoever take the last stick will win
-------------------welcome game!--------------------
Sticks left:  21
Player1 Take sticks(1-3):1
Player2 Take sticks(1-3):2
Sticks left:  18
Player1 Take sticks(1-3):1
Player2 Take sticks(1-3):2
Sticks left:  15
Player1 Take sticks(1-3):3
Player2 Take sticks(1-3):1
Sticks left:  11
Player1 Take sticks(1-3):2
Player2 Take sticks(1-3):1
Sticks left:  8
Player1 Take sticks(1-3):2
Player2 Take sticks(1-3):1
Sticks left:  5
Player1 Take sticks(1-3):2
Player2 Take sticks(1-3):1
Sticks left:  2
Player1 Take sticks(1-3):1
Player2 took the last stick, Player 2 lose, Player 1 win!
**********************Game**************************
Are you continue or exit,0: continue, 1: exit > 1
Exit! Bye!

Process finished with exit code 0

B) 2 players playing with player 2 wins

**********************Game**************************
Are you continue or exit,0: continue, 1: exit > 0
Choose your opponent,1: computer, 2: player 2 > 2
There are 21 sticks, you can take 1-3 number of sticks at a time.
Whoever take the last stick will win
-------------------welcome game!--------------------
Sticks left:  21
Player1 Take sticks(1-3):2
Player2 Take sticks(1-3):1
Sticks left:  18
Player1 Take sticks(1-3):2
Player2 Take sticks(1-3):2
Sticks left:  14
Player1 Take sticks(1-3):3
Player2 Take sticks(1-3):2
Sticks left:  9
Player1 Take sticks(1-3):1
Player2 Take sticks(1-3):3
Sticks left:  5
Player1 Take sticks(1-3):2
Player2 Take sticks(1-3):1
Sticks left:  2
Player1 Take sticks(1-3):2
Player1 took the last stick, Player 1 lose, Player 2 win!
**********************Game**************************
Are you continue or exit,0: continue, 1: exit > 1
Exit! Bye!

Process finished with exit code 0



C) Player with computer, computer starts first
**********************Game**************************
Are you continue or exit,0: continue, 1: exit > 0
Choose your opponent,1: computer, 2: player 2 > 1
There are 21 sticks, you can take 1-3 number of sticks at a time.
Whoever take the last stick will win
the computer is opponent,please choose which first: 1:computer, 2: you > 1
-------------------welcome game!--------------------
Sticks left:  21
Computer took:  3
Take sticks(1-3):2
Sticks left:  16
Computer took:  3
Take sticks(1-3):2
Sticks left:  11
Computer took:  2
Take sticks(1-3):3
Sticks left:  6
Computer took:  1
Take sticks(1-3):1
Sticks left:  4
Computer took:  3
Sticks left:  1
There is only one stick left! You took the last stick, you lose
**********************Game**************************
Are you continue or exit,0: continue, 1: exit > 1
Exit! Bye!

Process finished with exit code 0

D) Player with computer, player starts first

**********************Game**************************
Are you continue or exit,0: continue, 1: exit > 0
Choose your opponent,1: computer, 2: player 2 > 1
There are 21 sticks, you can take 1-3 number of sticks at a time.
Whoever take the last stick will win
the computer is opponent,please choose which first: 1:computer, 2: you > 2
-------------------welcome game!--------------------
Sticks left:  21
Take sticks(1-3):2
Computer took:  1
Sticks left:  18
Take sticks(1-3):1
Computer took:  2
Sticks left:  15
Take sticks(1-3):1
Computer took:  2
Sticks left:  12
Take sticks(1-3):2
Computer took:  1
Sticks left:  9
Take sticks(1-3):2
Computer took:  1
Sticks left:  6
Take sticks(1-3):1
Computer took:  2
Sticks left:  3
Take sticks(1-3):2
Computer took:  1
Computer took the last stick, Computer lose
**********************Game**************************
Are you continue or exit,0: continue, 1: exit > 1
Exit! Bye!

Process finished with exit code 0


'''