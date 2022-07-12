#The code to analyse
import csv
def wettest_city(data):
    max_rainfall = 0
    data= data[1:]
    city_list = []
    for row in data:
        current_city=row[0]
        for cell in row[1:]:
            rainfall = float(cell)
            if rainfall>max_rainfall:
                max_rainfall= rainfall
                city_list = [current_city]
            elif rainfall == max_rainfall:
                if current_city not in city_list:
                    city_list.append (current_city)
    return (max_rainfall, sorted(city_list))

def wettest_month (data):
    month_list = []
    max_rainfall=0
    for i in range(1, len(data[0])):
        current_month = data[0][i]
        for j in range(1, len(data)):
            cell=data[j][i]
            rainfall = float(cell)
            if rainfall >= max_rainfall:
                max_rainfall = rainfall
                month_list = [current_month]
            elif rainfall == max_rainfall:
                month_list.append (current_month)
    return (max_rainfall, sorted (set(month_list)))

def wettest_city1(data):
    max_rainfall = 0
    data= data[1:]
    city_list = []
    for row in data:
        current_city=row[0]

        i=1

        while i<len(row):
            cell = row[i]
            rainfall = float(cell)
            if rainfall > max_rainfall:
                max_rainfall = rainfall
                city_list = [current_city]
            elif rainfall == max_rainfall:
                if current_city not in city_list:
                    city_list.append(current_city)
            i+=1

    return (max_rainfall, sorted(city_list))


filename="city_rainfalls.csv"
csv_file = open(filename)
reader= csv.reader(csv_file)
data_list = list (reader)
csv_file.close()
print (wettest_city(data_list), wettest_month(data_list))