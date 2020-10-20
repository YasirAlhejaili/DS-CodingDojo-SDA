# Biggie

def biggie(the_list):
    for i in range(len(the_list)):
        if the_list[i]>0:
            the_list[i]='big'
    return the_list

print(biggie([1,5,-3]))

# Count Positives

def cout_p(the_list):
    cout = 0
    for i in the_list:
        if i > 0:
            cout = cout + 1
    the_list[len(the_list)-1] == cout
    return cout


print(cout_p([1,6,-4,-2,-7,-2]))

# Sum Total

def sum_tot(the_list):
    summ = sum(the_list)
    return summ 

print(sum_tot([1,2,3,4]))

# Average

def avg(the_list):
    the_return = ((sum(the_list))/(len(the_list)))
    return the_return

print(avg([1,2,3,4]))

# Length

def len_of_list(the_list):
    the_return = len(the_list)
    return the_return

print(len_of_list([37,2,1,-9]))

# Minimum 
    
def min_of_list(the_list):
    if len(the_list)<0:
        return False
    min_num = the_list[0]
    for i in the_list:
        if i < min_num:
            min_num = i
    return min_num
print(min_of_list([37,2,1,-9]))

# Maximum

def max_of_list(the_list):
    if len(the_list)<0:
        return False
    max_num = the_list[0]
    for i in the_list:
        if i > max_num:
            max_num = i
    return max_num

print(max_of_list([37,2,1,-9]))

# Ultimate Analysis (Optional)


def ultimate_analysis(array):
    myDictonary = {'sumTotal': 0, 'average': 0, 'minimum': array[0], 'maximun': array[0], 'length': len(array)}
    for val in array:
        if myDictonary['minimum']<val:
            myDictonary['minimum'] = val
        if myDictonary['maximun']>val:
            myDictonary['maximun'] = val
        myDictonary['sumTotal']+= val
        myDictonary['average']=myDictonary['sumTotal']/len(array)
    return myDictonary
print(ultimate_analysis([37,2,1,-9]))

# Reverse List (Optional)

def reverse_list(the_list):
    for i in range(0, (len(the_list)-1)//2):
        temp = the_list[i]
        the_list[i] = the_list[len(the_list)-1-i]
        the_list[len(the_list)-1-i] = temp
    return the_list
print(reverse_list([37,2,1,-9]))






    
    

    




