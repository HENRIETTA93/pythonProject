# from pyspark import SparkConf
# from pyspark import SparkContext
# from pyspark.sql import SparkSession
# from pyspark.rdd import RDD

# master = "local[*]"
# app_name = "Assignment1"
# spark_conf = SparkConf().setMaster(master).setAppName(app_name)
#
# spark = SparkSession.builder.config(conf=spark_conf).getOrCreate()
# sc = spark.sparkContext
# sc.setLogLevel('ERROR')



def read_file_rdd(file):
    rdd_1=sc.textFile(file)
    #remove the header
    header=rdd_1.first()
    rdd=rdd_1.filter(lambda row: row!=header)
    header_cols=header.split(",")
    tmp_list=[]
    for row in rdd.collect():
        row_cols=row.split(",")
        ci=0
        while ci<len(header_cols):
            if header_cols[ci]=="YEAR" or header_cols[ci]=="MONTH":
                row_cols[ci]=int(row_cols[ci])
            ci+=1
    return rdd



str="a"
if str == "a":
    print(str)