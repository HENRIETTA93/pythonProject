https://bostonu.zoom.us/rec/play/WWyR_jUaPid6jXxZE2iJAh50u8uurSpe2XkYdVY97Ya77KvmJ4vfUAhGxn7-CLEfTUatYYrmrJcMZnUL.uDRM1PYcAICblN8i?continueMode=true&_x_zm_rtaid=fvd178CZQ5iwMEwis6qlqA.1643912070978.5c705c30008d1744e7c2e85c9636d258&_x_zm_rhtaid=479


topic:
数据集源地址：
https://www.kaggle.com/johnharshith/hollywood-theatrical-market-synopsis-1995-to-2021?select=HighestGrossers.csv

Hollywood Theatrical Market Synopsis 1995 to 2021
topic 描述：
根据好莱坞电影1995-2021年市场数据，使用ETL load data、数据清洗等预处理
Then create dimensions based on the dataset and build data warehouse, and find
which dimensions will 影响电影市场的关键因素？which genre get the top 收益 in which year?
which production get the biggest profit between 1995 and 2001? and so on ..

I will use data warehouse and database 相关技术，使用eTL 技术 数据清洗等相关知识，
会用到数据仓库的建模（may be star schema or snowflake) so on .



https://www.kaggle.com/borismarjanovic/price-volume-data-for-all-us-stocks-etfs

https://www.kaggle.com/jacksoncrow/stock-market-dataset

https://www.kaggle.com/elenaeb/2021-vaers-vaccination-symptoms-adverse-data?select=2021VAERSVAX.csv



proposals:

本次个人project我将使用本学期所学的advanced database -- data warehouse 知识解决庞大的关系型数据的统计分析问题，
即通过将OLTP类型数据加载到data warehouse中, 并进行OLAP分析和可视化展示, 进而得到有建设性、发展性的意见。

--outline for the project--

data warehouse introduction:
in this part, I will introduce the concept of the data warehouse, the history of development of data warehouse
and 数据仓库技术对现代企业的影响。

dataset description:
in this part, I will introduce the dataset which I chose to build data warehouse.
such as the source of dataset, the volume of dataset and some key attributes of the dataset.

ETL:
in this part, I will use ETL technique (extract\transform\load) to load the dataset from the files. Besides, I will introduce some usual
ETL methods.

data cleansing:
in this part, I will show the original dataset structure first. then, I will check the dataset using data cleansing technique.
then make cleaning based on the dataset.

build data warehouse:
in this part, I will design data warehouse based on the clean dataset, then I will create data warehouse
and load the data using ETL into the data warehouse.

OLAP analysis:
in this part, I will use OLAP to analyze and show the result of the analysis.


https://www.kaggle.com/elenaeb/2021-vaers-vaccination-symptoms-adverse-data
this link is the dataset source, it 提供了中等规模的数据集可以帮助我进行data warehouse 建模及分析。

some example purpose of the project:
1. which symptoms are the most common based on the covid19.
2. 不同state的疫苗接种率.
3. 接种疫苗率与康复率是否具有关系.
4. 男性与女性的接种率
5. 男性与女性的恢复率
6. 男性与女性的死亡率 
and so on...


CREATE TABLE VAERSDATA (
  VAERS_ID text,
  RECVDATE text,
  STATE text,
  AGE_YRS text,
  CAGE_YR text,
  CAGE_MO text,
  SEX text,
  RPT_DATE text,
  SYMPTOM_TEXT longtext,
  DIED text,
  DATEDIED text,
  L_THREAT text,
  ER_VISIT text,
  HOSPITAL text,
  HOSPDAYS text,
  X_STAY text,
  DISABLE text,
  RECOVD text,
  VAX_DATE text,
  ONSET_DATE text,
  NUMDAYS text,
  LAB_DATA text,
  V_ADMINBY text,
  V_FUNDBY text,
  OTHER_MEDS text,
  CUR_ILL text,
  HISTORY text,
  PRIOR_VAX text,
  SPLTTYPE text,
  FORM_VERS text,
  TODAYS_DATE text,
  BIRTH_DEFECT text,
  OFC_VISIT text,
  ER_ED_VISIT text,
  ALLERGIES text
)
;