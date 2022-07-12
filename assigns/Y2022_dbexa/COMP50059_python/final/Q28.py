def note_separation(string_of_notes):
    lst=[]
    for x in string_of_notes:
        if x not in ['#','b']:
            lst.append(x)
        else:
            val=lst[-1]+x
            lst.pop()
            lst.append(val)
    return lst


string_notes="ABBCBbC#AF#"
lst=note_separation(string_notes)
print(lst)

