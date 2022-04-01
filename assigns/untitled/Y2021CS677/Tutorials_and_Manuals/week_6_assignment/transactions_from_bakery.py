# -*- coding: utf-8 -*-
"""
Created on Mon Feb  4 16:49:55 2019

@author: epinsky
"""

# transactions from a bakery
import os
import pandas as pd
import math
import numpy as np 
import random

input_dir = r'C:\Users\epinsky\bu\python\data_science_with_Python\datasets'
input_file  = os.path.join(input_dir, 'BreadBasket_DMS.csv')
output_file  = os.path.join(input_dir, 'BreadBasket_DMS_output.csv')


def compute_period(hour):
    if hour in range(0, 6):
        return 'night'
    elif hour in range(6, 12):
        return 'morning'
    elif hour in range(12, 18):
        return 'afternoon'
    elif hour in range(18, 24):
        return 'evening'
    else:
        return 'unknown'
    

df = pd.read_csv(input_file)

items = set(df['Item'])
price_dict = dict()
price_list = list(np.linspace(0.99, 10.99, 100))
for x in items:
    price_dict[x] = random.choice(price_list)
    
df['Item_Price'] = df['Item'].map(price_dict)
df['Item_Price'] = df['Item_Price'].round(2)


df['Date'] = pd.to_datetime(df['Date'])
df['Time'] = pd.to_datetime(df['Time'])
df['Month'] = df['Date'].dt.month
df['Year'] = df['Date'].dt.year 
df['Day'] = df['Date'].dt.day
df['Weekday'] = df['Date'].dt.weekday_name 

df['Hour'] = df['Time'].dt.hour
df['Min'] = df['Time'].dt.minute
df['Sec'] = df['Time'].dt.second

df['Period'] = df['Hour'].apply(compute_period)

df.reset_index(level=0)
col_list = ['Year','Month','Day','Weekday', 'Period', 
            'Hour','Min','Sec',
            'Transaction','Item','Item_Price']
df = df[col_list]

df.to_csv(output_file, index=False)




