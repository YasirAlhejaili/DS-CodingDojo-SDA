# Update Values in Dictionaries and Lists

x = [ [5,2,3], [10,8,9] ]

x[1][0]=15

print(f"x was orginally [[5, 2, 3], [10, 8, 9]]  and is now {x}")


students = [
     {'first_name':  'Michael', 'last_name' : 'Jordan'},
     {'first_name' : 'John', 'last_name' : 'Rosales'}
]

students[0]['last_name'] = 'Bryant'

print(f"student 1's new information is {students}")


sports_directory = {
    'basketball' : ['Kobe', 'Jordan', 'James', 'Curry'],
    'soccer' : ['Messi', 'Ronaldo', 'Rooney']
}

sports_directory['soccer'][0] = 'Andres'
for i in range(len(sports_directory['soccer'])):
    print(f"{sports_directory['soccer'][i]} and ")


z = [ {'x': 10, 'y': 20} ]

z[0]['y'] = 30
print(z)

# Iterate Through a List of Dictionaries

def iterateDictionary(some_list):
    stringReturn = ''
    for val in some_list:
        stringReturn += f"first_name - {val['first_name']}, last_name - {val['last_name']}\n"
    return stringReturn
print(iterateDictionary(students))

# Get Values From a List of Dictionaries

def iterateDictionary2(key_name, some_list):
    stringReturn = ''
    for val in some_list:
        stringReturn += f"{val[key_name]} \n"
    return stringReturn
print(iterateDictionary2('last_name',students))

# Iterate Through a Dictionary with List Values

dojo = {
   'locations': ['San Jose', 'Seattle', 'Dallas', 'Chicago', 'Tulsa', 'DC', 'Burbank'],
   'instructors': ['Michael', 'Amy', 'Eduardo', 'Josh', 'Graham', 'Patrick', 'Minh', 'Devon']
}

def printInfo(some_dict):

    for key in some_dict:
        print(f"{len(some_dict[key])} {key.upper()}")
        for val in some_dict[key]:
            print(val)
        print("")
printInfo(dojo)




