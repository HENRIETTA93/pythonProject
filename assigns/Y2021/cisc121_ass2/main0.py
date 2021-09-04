'''
main module
make user to input what they want to do.

'''
import csvHandler0 as csv
import inputCheck0 as chk
import handleData0 as hdata

SEARCH_TYPE=['identification number', 'department', 'priority level', 'call type', 'resolution status', 'communication feed']
CHOOSE=["1","2","3","4","5","6","7"]
print("*****Dataset CallLogs.csv Handler Begin*****")

def main():
    records = csv.readCSV("CallLogs.csv")
    print("Read CallLogs.csv dataset finined!")

    print("------------------------------------------------")
    print("Choose what you want to do!!!")
    print("1-Create New Record")
    print("2-Display Records")
    print("3-Retrieve Records")
    print("4-Update Records")
    print("5-Remove Record")
    print("6-Save Records to file")
    print("7-Exit")
    choose = input(">>")
    while choose not in CHOOSE:
        print("Please re-input! You can only input the number from [1-7]")
        choose = input(">>")

    while choose in CHOOSE:
        if choose == '1':
            records = hdata.createNewRecord(records)

            choose = input(">>")
            while choose not in CHOOSE:
                print("Please re-input! You can only input the number from [1-7]")
                choose = input(">>")
        elif choose == '2':
            hdata.displayRecords(records)

            choose = input(">>")
            while choose not in CHOOSE:
                print("Please re-input! You can only input the number from [1-7]")
                choose = input(">>")
        elif choose == '3':
            hdata.retriveRecordsWithInput(records)

            choose = input(">>")
            while choose not in CHOOSE:
                print("Please re-input! You can only input the number from [1-7]")
                choose = input(">>")
        elif choose == '4':
            hdata.updateRecordsWithInput(records)

            choose = input(">>")
            while choose not in CHOOSE:
                print("Please re-input! You can only input the number from [1-7]")
                choose = input(">>")
        elif choose == '5':
            records = hdata.removeRecordsWithInput(records)

            choose = input(">>")
            while choose not in CHOOSE:
                print("Please re-input! You can only input the number from [1-7]")
                choose = input(">>")
        elif choose == '6':
            filename = input("input your file name>>")
            csv.writeCSV(filename, records)
            choose = input(">>")
            while choose not in CHOOSE:
                print("Please re-input! You can only input the number from [1-7]")
                choose = input(">>")
        elif choose == '7':
            break


main()

print("*****Dataset CallLogs.csv Handler End*****")











