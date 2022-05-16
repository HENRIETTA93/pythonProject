import pandas as pd

df=pd.read_csv("hr.csv")

print(df.describe())

print(df.head())

print(df.mean())
print(type(df.mean()))

print(df['satisfaction_level'])
print(type(df['satisfaction_level']))


# 众数
print(df.mode())
print(df['satisfaction_level'].mode())

print(df['department'].mode())

print(df.std())
print(df['satisfaction_level'].std())

print(df.var())
print(df['satisfaction_level'].var())
print(df.sum())
print(df['satisfaction_level'].sum())


# 偏态系数
print(df.skew())
print(df['satisfaction_level'].skew())

# 丰态系数
print(df.kurt())
print(df['satisfaction_level'].kurt())


import scipy.stats as ss

print(ss.norm)
print(ss.norm.stats(moments="mvsk"))


## pdf
print(ss.norm.pdf(0.0))

## ppf 累计
print(ss.norm.ppf(0.9))

print(ss.norm.cdf(2))

print(ss.norm.cdf(2)-ss.norm.cdf(-2))

#rvs
print(ss.norm.rvs(size=10))

print(ss.chi2)

print(ss.t)

print(ss.f)

# 抽样
print(df.sample(n=10))
print(df.sample(frac=0.001))



