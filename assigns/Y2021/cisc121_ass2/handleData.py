'''
handle dataset:
retrive, display, create, update, remove data records.

'''
import inputCheck as chk

SEARCH_TYPE=['identification number', 'department', 'priority level', 'call type', 'resolution status', 'communication feed']
UPDATE_TYPE=['department name' ,'priority level','call type','resolution type','communication method']

def retriveRecords(call_log:list,search_type:str=None,search_value:str=None):
    '''
    Return all records that meet the search conditions
    :param call_log:
    :param search_type:
    :param search_value:
    :return:
    '''
    index=0
    result_records=[]
    if search_type==None or search_value==None:
        return call_log
    if search_type.lower() in chk.SEARCH_TYPE:
        try:
            index=chk.SEARCH_TYPE.index(search_type.lower())
        except:
            print("Wrong search type!!!")
            return result_records
        for rec in call_log:
            if rec[index].lower()==search_value.lower():
                result_records.append(rec)
        return result_records
    else:
        print("Wrong search type!!!")
        return result_records


def retriveRecordsWithInput(records:list):
    '''
    this function require user to input which records he/she want to display.
    then call function retriveRecords(records,search_type,search_value)
    :param records:
    :return:
    '''
    print("please input the condition what you want to retrive:\n------------------------------------------------")
    print("please input the retrive type: ['identification number', 'department', 'priority level', 'call type', 'resolution status', 'communication feed']")

    search_type=input("retrive type>>")
    while search_type not in SEARCH_TYPE:
        print("Wrong search type!!! Re-input retrive type.")
        search_type=input("retrive type>>")
    print("please input the retrive value:")
    search_value=input("retrive value>>")
    new_records=retriveRecords(records,search_type,search_value)
    if len(new_records)>0:
        displayRecords(new_records)
    else:
        print("Didn't retrive any records!")

    return


def displayRecords(records):
    '''
    display all records.
    :param records:
    :return:
    '''
    for rec in records:
        print(','.join(rec))


def createNewRecord(records):
    '''
    create a record based on the user's input
    :param records:
    :return:
    '''
    print("please input the new call which you want to add:\n------------------------------------------------\n"
                       "format like: identification number, department, priority level, call type, resolution status, communication feed\n"
                       "eg.: 23195,PARKING,1,COMPLIMENT,FALSE,PHONE\n")
    input_id_number=input("please input identification number\ncreate record>>")
    while chk.checkIDnumber(input_id_number) is False \
            or chk.checkIDnumberExists(input_id_number,records) is False:
        input_id_number = input("please re-input identification number\n>>")


    # if chk.checkIDnumber(input_id_number):
    #     pass
    # else:
    #     exit(0)
    input_depart=input("please input department\ncreate record>>")
    while chk.checkDepartType(input_depart) is False:
        input_depart=input("please re-input department\ncreate record>>")
    # if chk.checkDepartType(input_depart):
    #     pass
    # else:
    #     exit(0)
    input_priority = input("please input priority\ncreate record>>")
    while chk.checkPriorityLevel(input_priority) is False:
        input_priority = input("please re-input priority\ncreate record>>")
    # if chk.checkPriorityLevel(input_priority):
    #     pass
    # else:
    #     exit(0)
    input_calltype = input("please input call type\ncreate record>>")
    while chk.checkCallType(input_calltype) is False:
        input_calltype = input("please re-input call type\ncreate record>>")
    # if chk.checkCallType(input_calltype):
    #     pass
    # else:
    #     exit(0)

    input_resolution_status = input("please input resolution status\ncreate record>>")
    while chk.checkResolutionStatus(input_resolution_status) is False:
        input_resolution_status = input("please re-input resolution status\ncreate record>>")
    # if chk.checkResolutionStatus(input_resolution_status):
    #     pass
    # else:
    #     exit(0)

    input_comm_chl = input("please input communication channel\ncreate record>>")
    while chk.checkCommChannel(input_comm_chl) is False:
        input_comm_chl = input("please input communication channel\ncreate record>>")
    # if chk.checkCommChannel(input_comm_chl):
    #     pass
    # else:
    #     exit(0)

    new_record=[input_id_number,input_depart.upper(),input_priority,input_calltype.upper(),input_resolution_status.upper(),input_comm_chl.upper()]
    print("a new record is created: ",','.join(new_record))
    records.append(new_record)
    return records


def updateRecords(idnumber:str, update_type:str, update_content:str, call_records:list):
    '''
    update record based on the input
    :param idnumber:
    :param update_type:
    :param update_content:
    :param call_records:
    :return:
    '''
    flag=False
    for rec in call_records:
        if rec[0]==idnumber:
            print("before update: ", ",".join(rec))
            if update_type=='department name':
                if chk.checkDepartType(update_content):
                    rec[1]=update_content.upper()
                else:
                    exit(0)
            elif update_type=='priority level':
                if chk.checkPriorityLevel(update_content):
                    rec[2]=update_content
                else:
                    exit(0)
            elif update_type=='call type':
                if chk.checkCallType(update_content):
                    rec[3]=update_content.upper()
                else:
                    exit(0)
            elif update_type=='resolution type':
                if chk.checkResolutionStatus(update_content):
                    rec[4]=update_content.upper()
                else:
                    exit(0)
            elif update_type=='communication method':
                if chk.checkCommChannel(update_content):
                    rec[5]=update_content.upper()
                else:
                    exit(0)
            flag=True
            print("after update: ", ",".join(rec))

    if flag==False:
        print("No matching records!")






def updateRecordsWithInput(records):
    '''
    this function require user to input which id he/she want to update.
    then call function updateRecord(id, update_type,update_value,records)
    :param records:
    :return:
    '''
    print("please input the condition what you want to update:\n------------------------------------------------")

    print("please input the update type: ",",".join(UPDATE_TYPE))

    update_idnumber=input("update idnumber>>")
    while chk.checkIDnumber(update_idnumber) is False or chk.checkIDnumberNotExists(update_idnumber,records) is False:
        update_idnumber=input("update idnumber>>")

    update_type = input("update type>>")
    while update_type not in UPDATE_TYPE:
        print("Wrong update type!!! Re-input update type:",",".join(UPDATE_TYPE))
        update_type = input("update type>>")
    print("please input the update value:")
    update_value = input("update value>>")
    if update_type==UPDATE_TYPE[0]:
        while chk.checkDepartType(update_value) is False:
            update_value=input("update value>>")
        pass
    elif update_type==UPDATE_TYPE[1]:
        while chk.checkPriorityLevel(update_value) is False:
            update_value = input("update value>>")
        pass
    elif update_type==UPDATE_TYPE[2]:
        while chk.checkCallType(update_value) is False:
            update_value = input("update value>>")
        pass
    elif update_type==UPDATE_TYPE[3]:
        while chk.checkResolutionStatus(update_value) is False:
            update_value = input("update value>>")
        pass
    elif update_type==UPDATE_TYPE[4]:
        while chk.checkCommChannel(update_value) is False:
            update_value = input("update value>>")
    updateRecords(update_idnumber, update_type, update_value, records)
    return


def removeRecords(idnumber,call_records:list):
    '''remove record based on the input id number'''
    flag=False
    for rec in call_records:
        if rec[0]==idnumber:
            call_records.remove(rec)
            flag=True
    if flag==False:
        print("the call log doesn't have the associate call")
    return call_records

def removeRecordsWithInput(records):
    '''
    this function require user to input which id he/she want to remove.
    then call function removeRecord(id, records)
    :param records:
    :return:
    '''
    print("please input the condition what you want to remove:\n------------------------------------------------")

    print("please input the id number: ")

    remove_idnumber=input("remove idnumber>>")
    while chk.checkIDnumber(remove_idnumber) is False or chk.checkIDnumberNotExists(remove_idnumber,records) is False:
        remove_idnumber=input("remove idnumber>>")

    return removeRecords(remove_idnumber,records)
