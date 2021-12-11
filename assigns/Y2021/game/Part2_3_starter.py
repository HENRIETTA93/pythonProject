'''
Assignment background information:
    
    A company has 2 warehouses to keep their products (about 1000-10000 items). Every product has a unique product code and will only be stored in one of the 2 warehouses.
    Every year, stock taking will be done at both warehouses. The stock taking system is automated with a handheld device to scan through all inventories available and the result of all stock taking will be summarised and sorted by the productid at each of the warehouse. 
    In the past, the 2 text files WH1.txt and WH2.txt will be imported to the inventory system to update the
    year end stock balance to generate stock status report . 
    The company just upgraded their inventory system recently and it only allows a single file import and must be sorted by productid.

2 algorithms are proposed to solve the issue:
    
    Algorithm 1:
    	Read in all records in WH1.txt into a first list
    	Read in all records in WH2.txt into a second list
    	Perform a similar to merge-sort algorithm to form the final sorted list from the 2 lists
    
    Algorithm 2:
    	Make use of the pandas package 
        Read WH1.txt into a dataframe
    	Read WH2.txt into a second dataframe
    	Concatenate the 2 dataframes then sort by the product-id with the dataframe sort.
    	Extract the data to form the final sorted list from the 2 lists 
    
    Algorithm 3:
     	Read in all records in WH1.txt into a first list and prepare a parallel list for productID and quantity
    	Read in all records in WH2.txt into a second list and append to the parallel lists prepared
    	Perform a sort for the parallel list 
        Join the parallel lists to form the final sorted list from the 2 lists 
        (You may import sort_together from more_itertools)
        

You are required to do the following :
    1. code the 2 algorithms as functions as per proposed, 
    2. perform a Time Complexity analysis and 
    3. include  your findings as comment  with your testing codes and functions in a single .py file. 

In order to avoid "noises" due to file I/O overhead, a helper function stockTakeGenerator has been written
to simulate the reading of the 2 warehouses files. The return of this function is 2 lists representing
the readings from the text files, one example of the return is as follow :
    ['1000,639', '1001,503', '1002,430', '1004,185', '1007,649']
    ['1003,610', '1005,443', '1006,993']

Each element in the list is a string containing the productid and qty delimited by ,

The final sorted list from the 2 lists should be  
    ['1000,639', '1001,503', '1002,430', '1003,610','1004,185', '1005,443', '1006,993', '1007,649']
'''
import timeit
import random
import pandas as pd
from more_itertools import sort_together
import matplotlib.pyplot as plt 
import math 

def stockTakeGenerator(size):
    '''
    generate 2 lists 
    example :
            ['1000,639', '1001,503', '1002,430', '1004,185', '1007,649']
            ['1003,610', '1005,443', '1006,993']
    csv files input equivalent  

    Parameters
    ----------
    size : the number of product codes generated
           if size =3, then the return lists will each with 3 elements

    Returns
    -------
    2 string lists, each row in the format productID,qty
    productID from 1000 to 9999, no duplicate,sorted, qty from 1 to 999
    '''
    wh1=[]
    wh2=[]
    for stkcode in range(1000, 1000+size):
        if random.randint(0,1)==0:
            wh1.append(str(stkcode)+','+str(random.randint(1,999)))
        else:
            wh2.append(str(stkcode)+','+str(random.randint(1,999)))

    return wh1,wh2


def algor1():
    '''
    Algorithm 1:
	Read in all records in WH1.txt into a first list
	Read in all records in WH2.txt into a second list
	Perform a similar to merge-sort algorithm to form the final sorted list from the 2 lists

    '''
    ans =[]

    return ans




def algor2():
    '''
    Algorithm 2:
	Make use of the pandas package and read WH1.txt into a dataframe
	Read WH2.txt into a second dataframe
	Concatenate the 2 dataframes then sort by the product-id with the dataframe sort.
	Extract the data to form the list
    '''

    return ans



def algor3():
    '''
    Algorithm 3:
     	Read in all records in WH1.txt into a first list and prepare a parallel list for productID and quantity
    	Read in all records in WH2.txt into a second list and append to the parallel lists prepared
    	Perform a sort for the parallel list 
        Join the parallel lists to form the final sorted list from the 2 lists 
        (You may use  import sort_together from more_itertools)
    '''
    ans =[]

    return ans



    
if __name__ == "__main__":
    '''
    This is where you will prepare your testing program to ensure your algorithms are performing 
    as required by the specifications.
    '''
    wh1,wh2= stockTakeGenerator(10)
    list1 = wh1.copy()
    list2 = wh2.copy()
    print ("w1, w2 before alogorthm 1")
    print (list1)
    print (list2)

    print("after")
    print(algor1())


    list1 = wh1.copy()
    list2 = wh2.copy()
    print ("w1, w2 before alogorthm 2")
    print (list1)
    print (list2)
    print("after")
    print(algor2()) 
    
    list1 = wh1.copy()
    list2 = wh2.copy()
    print ("w1, w2 before alogorthm 3")
    print (list1)
    print (list2)
    print("after")
    print(algor3()) 
    
    
    '''
    This is where you should prepare your time complexity testings
    '''
    wh1,wh2= stockTakeGenerator(10)
    list1 = wh1.copy()
    list2 = wh2.copy()   
    print(list1)
    print(list2)
    '''
    Analysis Findings:

        Please insert how you test the algorithms, your findings and comment here, you should include 
        - what testings have you performed?
        - comparsions of the 3 algorithms you have written
        - your recommendations on the choice of the alogorithms

    '''