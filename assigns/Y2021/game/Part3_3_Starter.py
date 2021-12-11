# -*- coding: utf-8 -*-
"""
Created on Mon Dec  6 19:56:11 2021

@author: 
"""

class BankTransaction:
    pass     
        
class Deposit:
    pass

class Withdrawal:
    pass      

class BankStatement:
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

