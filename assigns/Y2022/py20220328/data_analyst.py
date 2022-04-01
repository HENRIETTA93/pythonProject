import json

import psycopg2
import datetime


# read json files
receipts_jsfile = open('receipts.json', 'r', encoding='windows-1252')
users_jsfile = open('users.json', 'r')
brands_jsfile = open('brands.json', 'r', encoding='windows-1252')
receipts_js_content = receipts_jsfile.read()
users_js_content = users_jsfile.read()
brands_js_content = brands_jsfile.read()


# parse json file
def parse_json(str):
    return str + "}"


receipts_jslist = receipts_js_content.split('}\n')

users_jslist = users_js_content.split("}\n")

brands_jslist = brands_js_content.split("}\n")

receipts = []
for receipt in receipts_jslist:
    if receipt is not None and receipt != '':
        receipts.append(json.loads(parse_json(receipt)))
users = []
for user in users_jslist:
    if user is not None and user != '':
        users.append(json.loads(parse_json(user)))

brands = []
for brand in brands_jslist:
    if brand is not None and brand != '':
        brands.append(json.loads(parse_json(brand)))

# manipulate database

try:
    # db = psycopg2.connect("dbname=property")
    db = psycopg2.connect("host=localhost dbname=data_analyst user=postgres port=5433 password=psql")


    drop_users = """
  drop table if exists users;
  """
    drop_brands="""drop table if exists brands"""

    drop_receipts="""drop table if exists receipts"""
    drop_receipt_items="""drop table if exists receipt_items"""
    create_users = """
  create table users(
  user_id varchar(100),
  createdDate timestamp,
  lastLogin timestamp,
  role varchar(100),
  active boolean,
  signUpSource varchar(100),
  state char(2)
  );
  """

    create_cpgs = """
  create table cpgs(
  
  );
  """
    create_brands = """
  create table brands(
  brand_id varchar(100),
  barcode varchar(30),
  category varchar(100),
  categoryCode varchar(100),
  name varchar(100),
  topBrand boolean
  );
  """
    create_receipts = """
  create table receipts(
  receipt_id varchar(100),
  bonusPointsEarned int,
  bonusPointsEarnedReason text,
  createDate timestamp,
  dateScanned timestamp,
  finishedDate timestamp,
  modifyDate timestamp,
  pointsAwardedDate timestamp,
  pointsEarned numeric,
  purchaseDate timestamp,
  purchasedItemCount int,
  rewardsReceiptStatus varchar(30),
  totalSpent numeric(10,2),
  user_id varchar(100)
  );
  """

    create_receipt_items="""
    create table receipt_items(
    receipt_id varchar(100),
    barcode varchar(30),
    description text,
    finalPrice numeric(10,2),
    needsFetchReview boolean,
    partnerItemId int,
    preventTargetGapPoints boolean,
    quantityPurchased int,
    userFlaggedBarcode varchar(30),
    userFlaggedNewItem boolean,
    userFlaggedPrice numeric(10,2),
    userFlaggedQuantity int
    );
    """
    cur = db.cursor()
    cur.execute(drop_users)
    db.commit()
    cur.execute(create_users)
    db.commit()
    cur.execute(drop_brands)
    db.commit()
    cur.execute(create_brands)
    db.commit()
    cur.execute(drop_receipts)
    db.commit()
    cur.execute(create_receipts)
    db.commit()

    cur.execute(drop_receipt_items)
    db.commit()
    cur.execute(create_receipt_items)
    db.commit()

    for user in users:
        insert_user = """insert into users(user_id,createdDate,lastLogin,role,active,signUpSource,state) 
      values('{}','{}','{}','{}','{}','{}','{}')"""
        user_id = user['_id']['$oid']
        active = user['active']
        create_date = datetime.datetime.fromtimestamp(user['createdDate']['$date'] / 1000)
        last_login = None
        if ('lastLogin' in user.keys()):
            last_login = datetime.datetime.fromtimestamp(user['lastLogin']['$date'] / 1000)
        role = user['role']
        signUpSource=None
        if ('signUpSource' in user.keys()):
            signUpSource = user['signUpSource']
        state=None
        if ('state' in user.keys()):
            state = user['state']
            # print(user_id, active, create_date, last_login,role)
            # print(insert_user.format(user_id,create_date,last_login,role,active))

        insert_user1 = insert_user.format(user_id, create_date, last_login, role, active, signUpSource, state)
        insert_user_final=insert_user1
        if 'lastLogin' not in user.keys() or 'signUpSource' not in user.keys() or 'state' not in user.keys():
            insert_user_final = insert_user1.replace("'None'", "null")

        cur.execute(insert_user_final)
        # cur.execute(insert_user.format(user_id, create_date, last_login, role, active, signUpSource, state))
    db.commit()



    for brand in brands:
        insert_brand = """insert into brands(brand_id,barcode,category,categoryCode,name,topBrand) 
              values('{}','{}','{}','{}','{}','{}')"""
        brand_id=brand['_id']['$oid']
        barcode=brand['barcode']
        category = None
        if 'category' in brand.keys():
            category = brand['category']
        categoryCode=None
        if 'categoryCode' in brand.keys():
            categoryCode=brand['categoryCode']
        name=brand['name']
        if "'" in name:
            name=name.replace("'","''")
        topBrand=None
        if 'topBrand' in brand.keys():
            topBrand=brand['topBrand']


        insert_brand1=insert_brand.format(brand_id,barcode,category,categoryCode,name,topBrand)
        insert_brand_final=insert_brand1
        if 'topBrand' not in brand.keys() or 'categoryCode' not in brand.keys() or 'category' not in brand.keys():
            insert_brand_final=insert_brand1.replace("'None'","null")

        # print(insert_brand.format(brand_id,barcode,category,categoryCode,name,topBrand))
        # print(insert_brand_final)
        cur.execute(insert_brand_final)
    db.commit()

    for receipt in receipts:
        insert_receipt = """insert into receipts(receipt_id,bonusPointsEarned,bonusPointsEarnedReason,
        createDate,dateScanned,finishedDate,modifyDate,pointsAwardedDate,pointsEarned,purchaseDate,
        purchasedItemCount,rewardsReceiptStatus,totalSpent,user_id) 
                      values('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')"""

        receipt_id=receipt['_id']['$oid']
        bonusPointsEarned=None
        if 'bonusPointsEarned' in receipt.keys():
            bonusPointsEarned=receipt['bonusPointsEarned']
        bonusPointsEarnedReason=None
        if 'bonusPointsEarnedReason' in receipt.keys():
            bonusPointsEarnedReason=receipt['bonusPointsEarnedReason']
        createDate=datetime.datetime.fromtimestamp(receipt['createDate']['$date']/1000)
        dateScanned=datetime.datetime.fromtimestamp(receipt['dateScanned']['$date']/1000)
        finishedDate=None
        if 'finishedDate' in receipt.keys():
            finishedDate=datetime.datetime.fromtimestamp(receipt['finishedDate']['$date']/1000)
        modifyDate=datetime.datetime.fromtimestamp(receipt['modifyDate']['$date']/1000)
        pointsAwardedDate=None
        if 'pointsAwardedDate' in receipt.keys():
            pointsAwardedDate=datetime.datetime.fromtimestamp(receipt['pointsAwardedDate']['$date']/1000)
        pointsEarned=None
        if 'pointsEarned' in receipt.keys():
            pointsEarned=receipt['pointsEarned']
        purchaseDate=None
        if 'purchaseDate' in receipt.keys():
            purchaseDate=datetime.datetime.fromtimestamp(receipt['purchaseDate']['$date']/1000)
        purchasedItemCount=None
        if 'purchasedItemCount' in receipt.keys():
            purchasedItemCount=receipt['purchasedItemCount']
        rewardsReceiptStatus=receipt['rewardsReceiptStatus']
        totalSpent=None
        if 'totalSpent' in receipt.keys():
            totalSpent=receipt['totalSpent']
        userId=receipt['userId']

        # print(insert_receipt.format(receipt_id,bonusPointsEarned,bonusPointsEarnedReason,
        #                             createDate,dateScanned,finishedDate,modifyDate,pointsAwardedDate,
        #                             pointsEarned,purchaseDate,purchasedItemCount,rewardsReceiptStatus,
        #                             totalSpent,userId))
        insert_receipt1=insert_receipt.format(receipt_id,bonusPointsEarned,bonusPointsEarnedReason,
                                    createDate,dateScanned,finishedDate,modifyDate,pointsAwardedDate,
                                    pointsEarned,purchaseDate,purchasedItemCount,rewardsReceiptStatus,
                                    totalSpent,userId)
        insert_receipt_final=insert_receipt1.replace("'None'","null")
        # print(insert_receipt_final)
        cur.execute(insert_receipt_final)

        if 'rewardsReceiptItemList' in receipt.keys():
            rewardsReceiptItemList=receipt['rewardsReceiptItemList']
            for item in rewardsReceiptItemList:
                # print(item)
                insert_item=""" insert into receipt_items(receipt_id,barcode,description,finalPrice,
                needsFetchReview,partnerItemId,preventTargetGapPoints,quantityPurchased,userFlaggedBarcode,
                userFlaggedNewItem,userFlaggedPrice,userFlaggedQuantity) 
                values('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}') """

                barcode=None
                if 'barcode' in item.keys():
                    barcode=item['barcode']
                description=None
                if 'description' in item.keys():
                    description=item['description']
                    if "'" in description:
                        description=description.replace("'","''")
                finalPrice=None
                if 'finalPrice' in item.keys():
                    finalPrice=item['finalPrice']
                needsFetchReview=None
                if 'needsFetchReview' in item.keys():
                    needsFetchReview=item['needsFetchReview']
                partnerItemId=item['partnerItemId']
                preventTargetGapPoints=None
                if 'preventTargetGapPoints' in item.keys():
                    preventTargetGapPoints=item['preventTargetGapPoints']
                quantityPurchased=None
                if 'quantityPurchased' in item.keys():
                    quantityPurchased=item['quantityPurchased']
                userFlaggedBarcode=None
                if 'userFlaggedBarcode' in item.keys():
                    userFlaggedBarcode=item['userFlaggedBarcode']
                userFlaggedNewItem=None
                if 'userFlaggedNewItem' in item.keys():
                    userFlaggedNewItem=item['userFlaggedNewItem']
                userFlaggedPrice=None
                if 'userFlaggedPrice' in item.keys():
                    userFlaggedPrice=item['userFlaggedPrice']
                userFlaggedQuantity=None
                if 'userFlaggedQuantity' in item.keys():
                    userFlaggedQuantity=item['userFlaggedQuantity']
                # print(insert_item.format(receipt_id,barcode,description,finalPrice,needsFetchReview,
                #                          partnerItemId,preventTargetGapPoints,quantityPurchased,
                #                          userFlaggedBarcode,userFlaggedNewItem,userFlaggedPrice,
                #                          userFlaggedQuantity))
                insert_item1=insert_item.format(receipt_id,barcode,description,finalPrice,needsFetchReview,
                                         partnerItemId,preventTargetGapPoints,quantityPurchased,
                                         userFlaggedBarcode,userFlaggedNewItem,userFlaggedPrice,
                                         userFlaggedQuantity)

                insert_item_final=insert_item1.replace("'None'","null")
                # print(insert_item_final)
                cur.execute(insert_item_final)
    db.commit()

except Exception as err:
    print("DB error: ", err)
finally:
    if db:
        db.close()
