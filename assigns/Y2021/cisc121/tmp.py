import random
def bets():
    random_list = range(1, 101)
    return random.choice(random_list)

def placeBets(players,banker,i,dic):
    random_chip=1
    dic[i] = []
    init_chips={}
    players_copy=players.copy()
    players_copy.remove(banker)
    for player in players_copy:
        if banker==players[2]:
            random_chip=bets()
        else:
            random_chip = input("banker input the bet: ")
        print("banker places the bets: {} against {}".format(random_chip, player))
        init_chips[banker]=random_chip
        init_chips[player] = random_chip
        dic[i].append(init_chips)
        init_chips={}
    return dic


players=['1','2','c']
banker='c'

# dic=placeBets(players,banker,1,{})
# print(dic)
# dic=placeBets(players,banker,2,dic)
# print(dic)

PAIR='Pair'
THREE_OF_KIND=['111','222','333','444','555','666']
FOUR_FIVE_SIX='456'
ONE_TWO_THREE='123'
def compareRolls(rolls):
    roll1=rolls[0]
    roll2=rolls[1]
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
    for p, roll in dic.items():
        if rollresult==roll:
            return p

def computeScore(rolls,dic_bets,i,total_chips):
    round_i_bets=dic_bets[i]
    current_rolls={}
    for p, roll in rolls.items():
        current_rolls[p]=roll[-1]
    print(current_rolls)
    print(round_i_bets)
    for dbet in round_i_bets:
        pkeys=dbet.keys()
        tmp_dic={}
        for p in pkeys:
            rollsstr=''.join(current_rolls.get(p))
            tmp_dic[p]=rollsstr
        rollresult=compareRolls(list(tmp_dic.values()))
        if rollresult==None:
            # re-roll
            pass
        betPlayer=findPlayer(rollresult,tmp_dic)
        total_chips[betPlayer]+=int(dbet[betPlayer])*2
        print(rollresult)
        print(total_chips)


    pass

rolls={'1': [['1', '5', '5'], ['3', '3', '5']], '2': [['1', '2', '3'], ['1', '2', '2']], 'computer': [['4', '5', '5'], ['3', '3', '4']]}
dic_bets={1: [{'2': '1', '1': '1'}, {'2': '2', 'computer': '2'}], 2: [{'2': '2', '1': '2'}, {'2': '3', 'computer': '3'}]}
i=2
total_chips={'1':0,'2':0,'computer':0}

computeScore(rolls,dic_bets,i,total_chips)




# dic={'2':0,'1':100}
#
# print(dic.items())



# roll='115'
# for r in list(roll):
#     if list(roll).count(r) == 1:
#         print(r)


chips={'1':3,'3':4}
origin_chips=chips.copy()
chips['3']=5
print(origin_chips)

rolls={'lucy': [['3', '4', '4'], ['2', '4', '4'], ['1', '4', '4'], ['1', '1', '3'], ['1', '2', '3'], ['1', '1', '2'], ['3', '5', '5'], ['1', '1', '5'], ['2', '5', '5'], ['1', '1', '5'], ['1', '1', '6'], ['3', '3', '5'], ['4', '4', '6'], ['2', '3', '3'], ['1', '3', '3'], ['1', '4', '4'], ['1', '1', '2'], ['2', '6', '6']], 'john': [['3', '3', '6'], ['1', '2', '3'], ['3', '3', '3'], ['4', '5', '5'], ['1', '1', '2'], ['4', '6', '6'], ['1', '5', '5'], ['4', '6', '6'], ['3', '6', '6'], ['1', '5', '5'], ['3', '5', '5'], ['1', '2', '3'], ['2', '5', '5'], ['3', '6', '6'], ['1', '2', '2'], ['1', '1', '5'], ['5', '5', '6'], ['2', '2', '3']], 'computer': [['2', '2', '4'], ['1', '1', '6'], ['4', '5', '5'], ['4', '4', '6'], ['1', '1', '3'], ['2', '4', '4'], ['2', '2', '6'], ['4', '5', '6'], ['1', '1', '4'], ['1', '1', '3'], ['5', '5', '6'], ['4', '5', '6'], ['2', '2', '3'], ['1', '5', '5'], ['1', '5', '5'], ['4', '4', '5'], ['1', '2', '3'], ['5', '5', '6']]}

for p, roll in rolls.items():
    print(len(roll))

def fun(dic,flag):
    dic_copy=dic.copy()
    dic_copy['1']=100
    if flag==True:
        return None


dic={'1':10}
fun(dic,True)
print(dic)


def maxTotalChips(total_chips):
    max_chips = 0
    chips_lst = []
    for p, chips in total_chips.items():
        chips_lst.append(chips)
        if max_chips < chips:
            max_chips = chips
    return chips_lst.count(max_chips)

chips={'lucy': 24, 'john': 116, 'computer': 216}

k=maxTotalChips(chips)
print(k)

def findMaxChips(total_chips):
    max_chips = 0
    player=''
    for p, chips in total_chips.items():
        if max_chips < chips:
            max_chips = chips
            player=p
    return player

k=findMaxChips(chips)
print(k)