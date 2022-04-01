# -*- coding: utf-8 -*-
"""
Created on Sun Jul 19 10:15:25 2020

@author: epinsky
"""

import os
import pandas as pd
import numpy as np
import pydotplus
import collections
import seaborn as sns
from sklearn.linear_model import LogisticRegression
from sklearn.linear_model import LinearRegression
from sklearn import svm, datasets
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler, LabelEncoder

# C:\Users\epinsky\AppData\Local\Continuum\anaconda3\Library\bin\graphviz

#os.environ["PATH"] += os.pathsep + 'C:/Program Files (x86)/Graphviz2.38/bin/'

input_dir = r'C:\Users\epinsky\bu\python\data_science_with_Python\datasets'
plot_dir = r'C:\Users\epinsky\bu\python\data_science_with_Python\plots'

file_name = os.path.join(input_dir, "data_banknote_authentication.csv")
df = pd.read_csv(file_name)

def plot_histograms(df, cols, color):
    for n_col in cols:
        print("mean for ", n_col, " is ", df[n_col].mean())
        print("mean for ", n_col, " is ", df[n_col].std())
        df.hist(n_col, bins = 10, color=color)
    return




cols = ["variance","skewness","curtosis","entropy"]

df_0 = df[df["class"]==0]
plot_histograms(df_0, cols, color="green")


df_1 = df[df["class"]==1]
plot_histograms(df_1, cols, color="red")

colors=["green"]
sns.set_palette(sns.color_palette(colors))
pair_plot_0 = sns.pairplot(df_0, vars = cols)
plt.show()
pair_plot_0.savefig(os.path.join(plot_dir,"good_banknotes.pdf"))

colors=["red"]
sns.set_palette(sns.color_palette(colors))
print("pairwise relationships for class 1")
pair_plot_1 = sns.pairplot(df_1, vars = cols)
plt.show()
pair_plot_1.savefig(os.path.join(plot_dir,"bad_banknotes.pdf"))


