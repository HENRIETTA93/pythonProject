-- 1
%%time
# flights_rdd.reduceBykey(lambda x y:x+y).collect()
# print(flights_rdd.filter(lambda x: 'N407AS' in x).count())
rdd=flights_rdd.filter(lambda x: 'N407AS' in x).map(lambda x :[(x[1],x[3]),x[22]])

# print(rdd.take(5))
# groupBy(lambda x:x[1]).mapValues(list).groupBy(lambda x: x[3]).mapValues(list)

seqOp = (lambda x, y: (x[0] + y, x[1] + 1))
combOp = (lambda x, y: (x[0] + y[0], x[1] + y[1]))
rdd=rdd.aggregateByKey((0,0),seqOp,combOp)

rdd=rdd.map(lambda x : [x[0],x[1][0]/x[1][1], x[1][1]])
print(rdd.sortBy(lambda x: x[0]).collect())

-- 2
%%time
flightsDf=flightsDf.withColumn('DEPARTURE_DELAY',flightsDf['DEPARTURE_DELAY'].cast(T.DecimalType()))

df_op=flightsDf.filter(flightsDf.TAIL_NUMBER =='N407AS').groupby(['MONTH','DAY_OF_WEEK']).agg(F.avg('DEPARTURE_DELAY').alias('MeanDeptDelay'),F.avg('ARRIVAL_DELAY').alias('MeanArrivalDelay'),F.count('MONTH').alias('NumOfFlights'))

df_op.orderBy(df_op.MONTH,df_op.DAY_OF_WEEK).show()

-- 3
%%time
sql_flights_op=spark.sql('''
select MONTH,DAY_OF_WEEK,avg(DEPARTURE_DELAY) as MeanDeptDelay,avg(ARRIVAL_DELAY) as MeanArrivalDelay,count(*) as NumOfFlights
from sql_flights
where TAIL_NUMBER ='N407AS'
group by MONTH,DAY_OF_WEEK
order by MONTH,DAY_OF_WEEK
''')
sql_flights_op.show()