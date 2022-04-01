import json

# jsonData = '{"a":1,"b":2,"c":3,"d":4,"e":5}';
#
# text = json.loads(jsonData)
# print(text)


f=open("receipts.json",'r',encoding='windows-1252')
receipts=f.read()

receipts_json=receipts.split("}\n")
print(receipts_json[0])
print(receipts_json[1118])
print(len(receipts_json))
# receipts_text=json.loads(receipts)
# print(receipts_text)

str1=receipts_json[0]+"}"

print(json.loads(str1))

dic=json.loads(str1)
print(dic['_id']['$oid'])
print(dic['bonusPointsEarned'])
print(dic['bonusPointsEarnedReason'])
print(dic['createDate'])
print(dic['rewardsReceiptItemList'])


print("------------")

receipts_jsfile=open('receipts.json','r',encoding='windows-1252')
users_jsfile=open('users.json','r')
brands_jsfile=open('brands.json','r',encoding='windows-1252')
receipts_js_content=receipts_jsfile.read()
users_js_content=users_jsfile.read()
brands_js_content=brands_jsfile.read()

# parse json file
def parse_json(str):
    return str+"}"
receipts_jslist=receipts_js_content.split('}\n')

users_jslist=users_js_content.split("}\n")

brands_jslist=brands_js_content.split("}\n")
receipts=[]
for receipt in receipts_jslist:
    if receipt is not None and receipt!='':
        receipts.append(json.loads(parse_json(receipt)))
users=[]
for user in users_jslist:
    if user is not None and user!='':
        users.append(json.loads(parse_json(user)))

brands=[]
for brand in brands_jslist:
    if brand is not None and brand!='':
        brands.append(json.loads(parse_json(brand)))

print(receipts[0])
print(users[0])
print(brands[0])

import datetime
timeStamp=1381419600
timeStamp=1609687444.8
timeStamp=1610032826.821
timeStamp=1610060994.656
dateArray = datetime.datetime.fromtimestamp(timeStamp)
otherStyleTime = dateArray.strftime("%Y-%m-%d %H:%M:%S")
print(otherStyleTime)

print(datetime.datetime.fromtimestamp(timeStamp).strftime("%Y-%m-%d %H:%M:%S"))

json1='{"_id":{"$oid":"5ff616a68f142f11dd189163"},"active":true,"createdDate":{"$date":1609963174996},"role":"consumer","signUpSource":"Email","state":"KY"}'
dic1=json.loads(json1)
print(dic1)
print('lastLogin' in dic1.keys())