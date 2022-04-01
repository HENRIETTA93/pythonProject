# -*- coding: utf-8 -*-
"""
Created on Mon Nov  5 14:37:29 2018

@author: epinsky
"""
import os
import pandas as pd
import matplotlib.pyplot as plt


ticker='MSFT'
input_dir = r'C:\Users\epinsky\bu\python\data_science_with_Python\datasets'

root_dir = input_dir = r'C:\Users\epinsky\bu\python\data_science_with_Python'
input_dir = r'C:\Users\epinsky\bu\python\data_science_with_Python\datasets'
ticker_file = os.path.join(input_dir, ticker + '.csv')
plot_dir = os.path.join(root_dir, 'plots')

try:   
    df = pd.read_csv(ticker_file)
    start_date='2017-01-09'; 
    end_date='2017-01-20'

    df = df[df['Date'] >= start_date]
    df = df[df['Date'] <= end_date]
    fig = plt.figure()
    ax = plt.gca()
    df = df[['Date','Week_Number','Weekday', 'Day', 'Adj Close']]
    weekday_list = df['Weekday'].tolist()
    ticks_list = df['Date'].tolist()
    plt.plot(df['Date'], df['Adj Close'])
    plt.xticks(ticks_list, weekday_list, rotation='vertical')
    plt.grid(True)
    plt.title('daily prices for ' + ticker +  ' from ' + start_date + ' to ' + end_date)
    plt.legend()
    output_file = os.path.join(plot_dir, ticker + '_prices_' + start_date + '_to_' + end_date +  '.pdf')
    plt.show()
    fig.savefig(output_file)
    
except Exception as e:
    print(e)
    print('failed to read stock data for ticker: ', ticker)













