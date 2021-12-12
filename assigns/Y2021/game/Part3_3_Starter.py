# -*- coding: utf-8 -*-
"""
Created on Mon Dec  6 19:56:11 2021

@author: 
"""

class BankTransaction:
    Date = ''
    Description = ''
    amount=0
    def __init__(self,Date,Description,amount):
        self.Date=Date
        self.Description=Description
        self.amount=amount

        
class Deposit(BankTransaction):

    def broughtForward(self,carriedForwardAmount):
        carriedForwardAmount+=self.amount
        return carriedForwardAmount
    # def __str__(self):
    #     return f'{self.Date:16s}{self.Description:24s}{self.amount:>16f}{" ":15s}{self.amount:15f}'



class Withdrawal(BankTransaction):

    def broughtForward(self,carriedForwardAmount):
        carriedForwardAmount-=self.amount
        return carriedForwardAmount

    # def __str__(self):
    #     return f'{self.Date:16s}{self.Description:24s}{" ":>16s}{self.amount:15f}{self.amount:15f}'
class BankStatement:
    opening=None
    tx=[]
    def __init__(self,opening):
        self.opening=opening

    def deposit(self,date,description,amount):
        dpst=Deposit(date,description,amount)
        self.tx.append(dpst)

    def withdrawal(self,date,description,amount):
        self.tx.append(Withdrawal(date,description,amount))


    def __str__(self):
        bank_statement=f'Opening Amount: ${self.opening:,.2f} \n'
        title=f'{"Date":16s}{"Description":24s}{"Deposit":>16s}{"Withdrawal":>15s}{"Balance":>15s}\n'
        balance=self.opening
        transaction_list=''
        for tr in self.tx:
            if type(tr) is Deposit:
                balance=tr.broughtForward(balance)
                tstr=f'{tr.Date:16s}{tr.Description:24s}{tr.amount:>16,.2f}{" ":15s}{balance:15,.2f}\n'
                transaction_list+=tstr
            if type(tr) is Withdrawal:
                balance=tr.broughtForward(balance)
                tstr = f'{tr.Date:16s}{tr.Description:24s}{" ":>16s}{tr.amount:15,.2f}{balance:15,.2f}\n'
                transaction_list += tstr
        closing=f'Closing Balance Amount :${balance:,.2f}'

        return bank_statement+title+transaction_list+closing


    pass
    
if __name__ == "__main__":
    bs = BankStatement(300)
    bs.deposit('2021-12-06','Salary',2500)
    bs.withdrawal('2021-12-06','Books',50)
    bs.deposit('2021-12-07','Gift',100)
    bs.deposit('2021-12-07','Rebate',89.12)
    bs.withdrawal('2021-12-08','Party',99)
    print(bs)
    
'''Expected Output:
Opening Amount :$300.00
Date           Description                      Deposit     Withdrawal        Balance
2021-12-06     Salary                          2,500.00                      2,800.00
2021-12-06     Books                                             50.00       2,750.00
2021-12-07     Gift                              100.00                      2,850.00
2021-12-07     Rebate                             89.12                      2,939.12
2021-12-08     Party                                             99.00       2,840.12
Closing Balance Amount :$2,840.12
'''

