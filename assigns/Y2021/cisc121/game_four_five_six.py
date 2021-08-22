import random

PAIR='Pair'
THREE_OF_KIND=['111','222','333','444','555','666']
FOUR_FIVE_SIX='456'
ONE_TWO_THREE='123'

def roll():
    '''
    the player make a roll
    :return:
    '''
    random_list = range(1, 7)
    return random.choice(random_list)


def firstRolls(player1, player2, player3):
    '''
    roll for player1, player2 and player3 once.
    return the result of three rolls.
    :param player1:
    :param player2:
    :param player3:
    :return:
    '''
    dic_player_rolls = {}
    player1_roll = roll()
    player2_roll = roll()
    player3_roll = roll()
    dic_player_rolls[player1] = player1_roll
    dic_player_rolls[player2] = player2_roll
    dic_player_rolls[player3] = player3_roll

    for player, rollnum in dic_player_rolls.items():
        print('{} rolls {}.'.format(player, rollnum))
    return dic_player_rolls


def determineBanker(dic_player_rolls):
    '''
    based on the dic_player_rolls, choose the banker as the max roll.
    :param dic_player_rolls:
    :return:
    '''
    banker = ''
    max_roll = 0
    for player, rollnum in dic_player_rolls.items():
        if rollnum > max_roll:
            max_roll = rollnum
            banker = player
    return (banker, max_roll)


def bets():
    '''
    this function is used to generate bet for computer player.
    the number is random of [1,100].
    :return:
    '''
    random_list = range(1, 101)
    return random.choice(random_list)

def playerRolls(players):
    dic_player_rolls={}
    rolllist=[]
    for player in players:
        while True:
            r1=roll()
            r2=roll()
            r3=roll()
            rolllist.append(str(r1))
            rolllist.append(str(r2))
            rolllist.append(str(r3))
            rolllist.sort()
            if  (r1==r2 and r2==r3) or (r1==r2 or r1==r3 or r2==r3)\
                or (''.join(rolllist)=='456')\
                or (''.join(rolllist)=='123'):
                break
            else:
                rolllist.clear()

        dic_player_rolls[player]=rolllist
        rolllist=[]
    for p, rlist in dic_player_rolls.items():
        print('{} rolls a {}'.format(p,','.join(rlist)))
    return dic_player_rolls


def playerRolls(players, banker, dic_player_rolls):
    '''
    this function is used to random generate the rolls for three players.
    firstly, generate the banker's rolls.
    dic_player_rolls is a dictionary which restore the all rolls history of there players.
    :param players:
    :param banker:
    :param dic_player_rolls:
    :return:
    '''
    players_copy=players.copy()
    players_copy.remove(banker)
    rolllist=[]
    rolls_round=dic_player_rolls[banker]
    while True:
        r1 = roll()
        r2 = roll()
        r3 = roll()
        rolllist.append(str(r1))
        rolllist.append(str(r2))
        rolllist.append(str(r3))
        rolllist.sort()
        if (r1 == r2 and r2 == r3) or (r1 == r2 or r1 == r3 or r2 == r3) \
                or (''.join(rolllist) == '456') \
                or (''.join(rolllist) == '123'):
            print('{} rolls a {}'.format(banker, ','.join(rolllist)))
            break
        else:
            print('{} rolls a {}, it\'s  a fumble -- the player must re-roll!!!'.format(banker,','.join(rolllist)))
            rolllist.clear()
    rolls_round.append(rolllist)
    rolllist = []
    for player in players_copy:
        rolls_round=dic_player_rolls[player]
        while True:
            r1=roll()
            r2=roll()
            r3=roll()
            rolllist.append(str(r1))
            rolllist.append(str(r2))
            rolllist.append(str(r3))
            rolllist.sort()
            if  (r1==r2 and r2==r3) or (r1==r2 or r1==r3 or r2==r3)\
                or (''.join(rolllist)=='456')\
                or (''.join(rolllist)=='123'):
                print('{} rolls a {}'.format(player,','.join(rolllist)))
                break
            else:
                print('{} rolls a {}, it\'s a fumble -- the player must re-roll!!!'.format(player,','.join(rolllist)))
                rolllist.clear()

        rolls_round.append(rolllist)
        rolllist=[]
    # for p, rlist in dic_player_rolls.items():
    #     print('{} rolls a {}'.format(p,','.join(rlist[-1])))
    return dic_player_rolls


def changeBanker(rolls,banker):
    '''
    this function need two params: rolls and banker.
    rolls is the whole rolls of three players.
    banker is the current banker.
    execution this function will return new banker.
    :param rolls:
    :param banker:
    :return:
    '''
    current_rolls=[]
    for p, rolllist in rolls.items():
        current_roll=rolllist[-1]
        current_rolls.append(current_roll)
    for roll in current_rolls:
        if roll==FOUR_FIVE_SIX and current_rolls.count(roll)>=2:
            print("random choose a banker...")
    for p, rolllist in rolls.items():
        current_roll = rolllist[-1]
        if p!=banker:
            if ''.join(current_roll)==FOUR_FIVE_SIX:
                print('for {} rolls {}, so {} becomes new banker in the next round!!!'.format(p,FOUR_FIVE_SIX,p))
                return p
    return banker


def placeBets(players,banker,i,dic):
    '''
    this function is used to record the human user's bet.
    allow user to input their bet.
    and use dictionary to record the initial bet dic.
    :param players:
    :param banker:
    :param i:
    :param dic:
    :return:
    '''
    random_chip=1
    # i means the number of round
    dic[i] = []
    init_chips={}
    players_copy=players.copy()
    players_copy.remove(banker)
    for player in players_copy:
        if banker==players[2]:
            random_chip=bets()
        else:
            while True:
                try:
                    random_chip = input("banker input the bet: ")
                    if int(random_chip)>0:
                        break
                    else:
                        print("please input valid number (1-100) !!!")
                except:
                    print("please input valid number (1-100) !!!")

        print("banker-{} places the bets: {} against {}".format(banker,random_chip, player))
        init_chips[banker]=random_chip
        init_chips[player] = random_chip
        dic[i].append(init_chips)
        init_chips={}
    return dic


def showChips(total_chips):
    '''
    this function is used to print the current total chips of three players.
    :param total_chips:
    :return:
    '''
    for p, chip in total_chips.items():
        print('{} has {} chips'.format(p, chip))


def compareRolls(rolls):
    '''
    compare two players's rolls: return the winner roll.
    if two players roll the same, return None.
    :param rolls:
    :return:
    '''
    roll1=rolls[0]
    roll2=rolls[1]
    if roll1==roll2 and roll1==FOUR_FIVE_SIX or roll1==roll2 and roll1==ONE_TWO_THREE:
        return None
    if roll1 in THREE_OF_KIND and roll2 in THREE_OF_KIND:
        return None
    if roll1 in THREE_OF_KIND and roll2==FOUR_FIVE_SIX:
        return roll2
    if roll1==FOUR_FIVE_SIX and roll in THREE_OF_KIND:
        return roll1
    if roll1 in THREE_OF_KIND or roll1==FOUR_FIVE_SIX or roll2==ONE_TWO_THREE:
        return roll1
    if roll2 in THREE_OF_KIND or roll2==FOUR_FIVE_SIX or roll1==ONE_TWO_THREE:
        return roll2

    roll1_lst=list(roll1)
    r1_point=0
    r2_point=0
    for r in roll1_lst:
        if roll1_lst.count(r)==1:
            r1_point=int(r)
            # print(r)
    roll2_lst = list(roll2)
    for r in roll2_lst:
        if roll2_lst.count(r) == 1:
            r2_point=int(r)
            # print(r)
    if r1_point>r2_point:
        return roll1
    elif r1_point<r2_point:
        return roll2
    else:
        return None

    pass

def findPlayer(rollresult,dic):
    '''
    this function is used to find the player based on the roll result.
    :param rollresult:
    :param dic:
    :return:
    '''
    for p, roll in dic.items():
        if rollresult==roll:
            return p

def computeScore(rolls,dic_bets,i,total_chips):
    '''
    this function is used to compute the score after a round rolls.
    and update the total chips of three players.
    :param rolls:
    :param dic_bets:
    :param i:
    :param total_chips:
    :return:
    '''
    orign_total_chips=total_chips.copy()
    round_i_bets=dic_bets[i]
    current_rolls={}
    for p, roll in rolls.items():
        current_rolls[p]=roll[-1]
    # print(current_rolls)
    # print(round_i_bets)
    for dbet in round_i_bets:
        pkeys=dbet.keys()
        tmp_dic={}
        for p in pkeys:
            rollsstr=''.join(current_rolls.get(p))
            tmp_dic[p]=rollsstr
        rollresult=compareRolls(list(tmp_dic.values()))
        if rollresult==None:
            # re-roll
            total_chips=orign_total_chips
            return None
        # betPlayer=findPlayer(rollresult,tmp_dic)
        # total_chips[betPlayer]+=int(dbet[betPlayer])*2
        # print(total_chips)
    for dbet in round_i_bets:
        pkeys=dbet.keys()
        tmp_dic={}
        for p in pkeys:
            rollsstr=''.join(current_rolls.get(p))
            tmp_dic[p]=rollsstr
        rollresult=compareRolls(list(tmp_dic.values()))
        betPlayer=findPlayer(rollresult,tmp_dic)
        total_chips[betPlayer]+=int(dbet[betPlayer])*2
        # print(total_chips)
    return 1


def maxTotalChips(total_chips):
    '''
    this function is used to count the number of most chips.
    :param total_chips:
    :return:
    '''
    max_chips = 0
    chips_lst = []
    for p, chips in total_chips.items():
        chips_lst.append(chips)
        if max_chips < chips:
            max_chips = chips
    return chips_lst.count(max_chips)

def findMaxChips(total_chips):
    '''
    this function is used to find the player which win the game(means have the most chips)
    :param total_chips:
    :return:
    '''
    max_chips = 0
    player=''
    for p, chips in total_chips.items():
        if max_chips < chips:
            max_chips = chips
            player=p
    return player
def main():
    print("************Game of Four,Five,Six************")
    players = []
    player1 = input("please input your name: ")
    player2 = input("please input your name: ")
    player3 = "computer"
    players.append(player1)
    players.append(player2)
    players.append(player3)
    print("----------------------------------------------")
    print("game start!")
    print("two human players are: {}, {}.".format(player1, player2), "a computer player is: computer")
    print("----------------------------------------------")
    print("determine the banker, each player rolls a die")

    banker = () # record the banker
    dic_player_rolls = {} # record the first rolls
    while True:
        dic_player_rolls = firstRolls(player1, player2, player3)
        banker = determineBanker(dic_player_rolls)
        roll_lst = list(dic_player_rolls.values())
        if roll_lst.count(banker[1]) == 1:
            break
        else:
            print("there's more than one player have the highest score, so re-roll!")
    print('the banker is {}'.format(banker[0]))
    print("----------------------------------------------")


    total_chips = {player1:0,player2:0, player3:0}
    i=1
    dic_bets = {} # store the bets of every round

    dic_player_rolls_round = {}
    dic_player_rolls_round[player1] = []
    dic_player_rolls_round[player2] = []
    dic_player_rolls_round[player3] = []

    newBanker=banker[0]
    while i<=15:
        print("----------------------------------------------")
        print('the {} round plays:'.format(str(i)))
        dic_bets = placeBets(players, newBanker, i, dic_bets)
        # print(dic_bets)

        dic_player_rolls_round = playerRolls(players, newBanker, dic_player_rolls_round)

        result=computeScore(dic_player_rolls_round,dic_bets,i,total_chips)
        while result==None:
            print("Two players tie for the highest score, require re-roll!!!")
            dic_player_rolls_round = playerRolls(players, newBanker, dic_player_rolls_round)
            result = computeScore(dic_player_rolls_round, dic_bets, i, total_chips)
            if result!=None:
                break
        newBanker=changeBanker(dic_player_rolls_round,newBanker)

        # print("rolls:", dic_player_rolls_round)



        print("after round {}, the total chips of three players:".format(i))
        showChips(total_chips)
        i+=1



    # max_chips=0
    # chips_lst=[]
    # for p,chips in total_chips.items():
    #     chips_lst.append(chips)
    #     if max_chips<chips:
    #         max_chips=chips


    if maxTotalChips(total_chips)>1:
        while True:
            print("----------------------------------------------")
            print('the {} round plays:'.format(str(i)))
            dic_bets = placeBets(players, newBanker, i, dic_bets)

            dic_player_rolls_round = playerRolls(players, newBanker, dic_player_rolls_round)

            result = computeScore(dic_player_rolls_round, dic_bets, i, total_chips)
            while result == None:
                print("Two players tie for the highest score, require re-roll!!!")
                dic_player_rolls_round = playerRolls(players, newBanker, dic_player_rolls_round)
                result = computeScore(dic_player_rolls_round, dic_bets, i, total_chips)
                if result != None:
                    break
            newBanker = changeBanker(dic_player_rolls_round, newBanker)

            # print("rolls:", dic_player_rolls_round)

            print("after round {}, the total chips of three players:".format(i))
            showChips(total_chips)

            if maxTotalChips(total_chips)==1:
                break
            i += 1

    player=findMaxChips(total_chips)
    print("after round {}, the winner player is {}, the max chips is {} ".format(i-1,player,total_chips[player]))

    print("game over!")









if __name__ == "__main__":
    main()



