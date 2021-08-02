####
'''
# 安装Pandas
pip install pandas

Pycharm 开发环境安装
File->settings->Project Interpreter->+->Available Packages->pandas

安装Pandas 依赖库：
pip install xlrd or Pycharm 开发环境安装
pip install xlwt or Pycharm 开发环境安装


## Series对象
Series: 带标签的一维同构数组

创建Series对象：
s=pd.Series(data,index=index)
data:表示数据，支持python字典、多维数组、标量值
index: 表示行标签（索引）

创建Series对象会自动生成整数索引，默认值从0开始至数据长度减1.
可以通过index参数手动设置索引.

Series位置索引，从0开始. e.g.: s1[0]
Series标签索引: []里面使用索引名称.
若需要获取多个标签索引值，用[[]]表示.

Series切片索引：
*用标签索引做切片，包头包尾
*用位置索引做切片，和list用法一样，包头不包尾

获取Series索引和值
s1.index
s1.values

## DataFrame对象
DataFrame: 带标签的，大小可变的二维异构表格

创建一个DataFrame对象
pandas.DataFrame(data,index,columns,dtype,copy)
data: 表示数据发，可以是ndarray数组、Series对象、列表、字典等
index：表示行标签（索引）
columns：列标签
dtype：每一列数据的数据类型（与python数据类型有所不同，如：object数据类型对应的是python的字符型）
copy：用于复制数据

DataFrame重要属性和函数
```
values：查看所有元素的值 df.values
dtypes: 查看所有元素的类型 df.dtypes
index: 查看所有行名、重命名行名 df.index df.index=[1,2,3]
columns: 查看所有列明、重命名列名 df.columns df.colums=[1,2,3]
T：行列数据转换 df.T
head: 查看前n条数据，默认5条 df.head(), df.head(10)
tail: 查看后n条数据，默认5条 df.tail(), df.tail(10)
shape: 查看行数和列数, [0]表示行，[1]表示列 df.shape[0], df.shape[1]
info: 查看索引,数据类型和内存信息 df.info


****重要函数****
describe:
count:
sum:
max:
argmax:
argmin:
idxmax:
idxmin:
mean:
median:
var:
std:
isnull:
notnull:
```



## 导入外部数据、导出数据
pandas.read_excel()
pandas.read_csv()
导入.txt文件
同样使用read_csv()方法，不同的是需要指定sep参数(如制表符\t).
导入html网页：
pandas.read_html()

## 数据抽取、增加、修改、删除

## 数据清洗

## 统计分析
排序
数据计算(求和、均值、最大、最小、中位数、方差、标准差、分位数)

数据格式化(小数位数、百分比、千位分隔符)

数据分组统计(groupby、对分组数据迭代、聚合agg())

数据移位

数据转换

数据合并

日期数据处理

时间序列


'''