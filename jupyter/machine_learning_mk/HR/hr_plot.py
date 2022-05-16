import matplotlib.pyplot as plt
import seaborn as sns
# import plotly
import pandas as pd
import numpy as np

df=pd.read_csv("HR.csv")


print(np.arange(len(df['salary'].value_counts())))
print(df['salary'].value_counts().index)


### 柱状图
plt.title('SALARY')
plt.xlabel('salary')
plt.ylabel('number')
plt.xticks(np.arange(len(df['salary'].value_counts()))+0.5, df['salary'].value_counts().index)
plt.axis([0,4,0,10000])
plt.bar(np.arange(len(df['salary'].value_counts()))+0.5, df['salary'].value_counts(), width=0.5)
for x, y in zip(np.arange(len(df['salary'].value_counts()))+0.5, df['salary'].value_counts()):
    plt.text(x,y,y, ha='center', va='bottom')
plt.show()


### seaborn

sns.set_style(style="darkgrid")
# sns.set_context(context="poster", font_scale=0.8)
sns.set_palette(sns.color_palette("husl", 9))

# sns.countplot(x='salary',data=df)
sns.countplot(x='salary', hue='department', data=df)
plt.show()
# sns.set_palette('Reds')
# plt.title('SALARY')
# plt.xlabel('salary')
# plt.ylabel('number')
# plt.xticks(np.arange(len(df['salary'].value_counts()))+0.5, df['salary'].value_counts().index)
# plt.axis([0,4,0,10000])
# plt.bar(np.arange(len(df['salary'].value_counts()))+0.5, df['salary'].value_counts(), width=0.5)
# for x, y in zip(np.arange(len(df['salary'].value_counts()))+0.5, df['salary'].value_counts()):
#     plt.text(x,y,y, ha='center', va='bottom')
# plt.show()



#### 直方图

f=plt.figure()
f.add_subplot(1,3,1)
# sns.displot(df['satisfaction_level'],bins=10,kde=True,hist=False)
sns.displot(df['satisfaction_level'],bins=10,kde=True)
f.add_subplot(1,3,2)
sns.displot(df['last_evaluation'], bins=10,kde=True)
f.add_subplot(1,3,3)
sns.displot(df['average_montly_hours'],bins=10, kde=True)
plt.show()

lst=['q1','q2']
print(lst)