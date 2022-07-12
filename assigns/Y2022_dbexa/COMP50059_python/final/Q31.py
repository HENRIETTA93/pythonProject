
def handl_cis_subjects():
    f=open("cis_subjects.txt","r")
    content=f.read()
    dic_enroll={}
    for line in content.split("\n"):
        cis=line.split(",")
        if cis[0] not in dic_enroll.keys():
            dic_enroll[cis[0]]=cis[1]
    return dic_enroll

dic_enroll=handl_cis_subjects()
while True:
    inputs = input("Enter two subjects:")
    if inputs=="exit":
        break
    ins = inputs.split("/")
    if (ins[0] not in dic_enroll.keys() or ins[1] not in dic_enroll.keys()):
        print("Input subject not found")
        continue
    enrol1 = int(dic_enroll[ins[0]])
    enrol2 = int(dic_enroll[ins[1]])
    if (enrol1 >= enrol2):
        print(
            "The difference in enrollment numbers between " + ins[0] + " and " + ins[1] + " is " + str(enrol1 - enrol2))

    else:
        print(
            "The difference in enrollment numbers between " + ins[1] + " and " + ins[0] + " is " + str(enrol2 - enrol1))

