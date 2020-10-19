# Countdown

def a(x):
    for x in range(x , -1 ,-1):
        print(x)

a(7)

# Print and Return

def p_r(a , b) :
    print(a)
    return(b)

p_r(3 , 7)

# First Plus Length

def f_p_l(the_list):
    fisrt_num = 0
    for i in the_list:
        fisrt_num = the_list[0]
    return fisrt_num + len(the_list)

print(f_p_l([2,3,4,7,8]))

# This Length, That Value

def tl_tv(size , value):
    new_list = []
    for i in range(size):
        new_list.append(value)
    return new_list

tl_tv(7,5)

# Values Greater than Second (Optional)

def v_greater_than_2nd(a):
    if len(a)<2:
        return False
    the_new_list = []
    for x in a:
        if x>a[1]:
            the_new_list.append(x)
    print(len(the_new_list)) 
    return the_new_list
        
v_greater_than_2nd([5,2,3,2,1,4])

v_greater_than_2nd([3])

        
    

        
