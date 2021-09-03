'''
check module
check whether every input meets requirements
'''
DEPART_TYPE = ['ROADS', 'BYLAW', 'WASTE', 'UTILITIES', 'PARKING', 'RECREATION', 'FIRE']
CALL_TYPE = ['COMPLAINT', 'COMPLIMENT']
COMMUNICATION_CHANELL = ['PHONE', 'EMAIL', 'SOCIALMEDIA']
RESOLUTION_STATUS = ['TRUE', 'FALSE']
SEARCH_TYPE = ['identification number', 'department', 'priority level', 'call type', 'resolution status',
               'communication feed']


def checkIDnumber(idnumber):
    if len(str(idnumber)) != 5:
        print("The identification number is numeric (no other characters) and consists of only 5 digits.")
        return False
    else:
        if str(idnumber).isdigit():
            return True
        else:
            print("The identification number is numeric (no other characters) and consists of only 5 digits.")
            return False


def checkIDnumberExists(idnumber,records):
    for rec in records:
        if rec[0]==idnumber:
            print("The identification number exists.")
            return False
    return True

def checkIDnumberNotExists(idnumber,records):
    for rec in records:
        if rec[0]==idnumber:
            return True
    print("The identification number not exists.")
    return False



def checkDepartType(department_type:str):
    if department_type.upper() not in DEPART_TYPE:
        print("The department type is one of: 'ROADS', 'BYLAW', 'WASTE', 'UTILITIES', 'PARKING', 'RECREATION', 'FIRE'")
        return False
    return True


def checkPriorityLevel(priority_level):
    try:
        if int(priority_level) < 1 or int(priority_level) > 5:
            print("The priority level should be an integer between 1 and 5 (inclusive)")
            return False
    except:
        print("The priority level should be an integer between 1 and 5 (inclusive)")
        return False
    return True


def checkCallType(call_type:str):
    if call_type.upper() not in CALL_TYPE:
        print("The call type is one of the following values: 'COMPLAINT' or 'COMPLIMENT'")
        return False
    return True


def checkCommChannel(communication_channel:str):
    if communication_channel.upper() not in COMMUNICATION_CHANELL:
        print("The communication channel should be one of the following values: 'PHONE', 'EMAIL', 'SOCIALMEDIA'")
        return False
    return True


def checkResolutionStatus(resolution_status:str):
    if resolution_status.upper() not in RESOLUTION_STATUS:
        print("The resolution status is one of the following values: 'TRUE' or 'FALSE'")
        return False
    return True
