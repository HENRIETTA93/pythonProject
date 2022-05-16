import pandas as pd
import numpy as np
df=pd.read_csv("HR.csv")

print(df)

sl=df['satisfaction_level']

print(sl.isnull())

print(sl[sl.isnull()])

print(df[df['satisfaction_level'].isnull()])

sl=sl.dropna()
# fillna()


print(sl.mean())

print(sl.std())

print(sl.max())

print(sl.min())

print(sl.median())

print(sl.quantile(q=0.25))

print(sl.quantile(q=0.75))


print(sl.skew())

print(sl.kurt())

# 分布间隔
print(np.histogram(sl.values, bins=np.arange(0.0,1.1,0.1)))


################################################

le=df['last_evaluation']
print(le[le.isnull()])

print(le.mean())

print(le.std())
print(le.median())
print(le.max())
print(le.min())
print(le.skew())
print(le.kurt())

print(le[le>1])


print(le.quantile(q=0.25))
print(le.quantile(q=0.75))

print(np.histogram(le.values,bins=np.arange(0.0,1.1,0.1)))


############################################################
nps=df['number_project']
print(nps[nps.isnull()])

print(nps.mean())

print(nps.std())

print(nps.median())

print(nps.skew())

print(nps.kurt())

print(nps.value_counts())

print(nps.value_counts(normalize=True).sort_index())


###################################################

amh=df['average_montly_hours']

print(amh.mean())
print(amh.std())

print(amh.max())

print(amh.min())

print(amh.skew())

print(amh.kurt())


print(amh[amh<amh.quantile(0.75)+1.5*(amh.quantile(0.75)-amh.quantile(0.25))][amh>amh.quantile(0.25)-1.5*(amh.quantile(0.25)+amh.quantile(0.75))])


print(np.histogram(amh.values,bins=10))

print(np.histogram(amh.values, bins=np.arange(amh.min(), amh.max()+10,10)))


print(amh.value_counts(bins=np.arange(amh.min(), amh.max()+10,10)))

##################################################

tsc=df['time_spend_company']

print(tsc.value_counts().sort_index())
print(tsc.mean())


##################################

was=df['Work_accident']

print(was.value_counts())

print(was.mean())


#######################
left=df['left']

print(left.value_counts())

################################
pl5=df['promotion_last_5years']
print(pl5.value_counts())


####################################
sal=df['salary']

print(sal.value_counts())

print(sal.where(sal=='nme'))

print(sal.where(sal!='nme').dropna())


####################################
dept=df['department']
print(dept.value_counts(normalize=True))

dept=dept.where(dept!='sale').dropna()
print(dept)


###########################################
## how=any/ all
df=df.dropna(axis=0, how="any")

print(df)

df=df[df['last_evaluation']<=1][df['salary']!='nme'][df['department']!='sale']
print(df)


print(df.groupby('department').mean())

print(df.loc[:,['last_evaluation','department']].groupby('department').mean())


print(df.loc[:,['average_montly_hours','department']].groupby('department')['average_montly_hours'].apply(lambda x:x.max()-x.min()))