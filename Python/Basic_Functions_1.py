#1 i think "5"
def a():
    return 5
print(a())

#2 i think "10"
def a():
    return 5
print(a()+a())

#3 i think "5" the first return
def a():
    return 5
    return 10
print(a())

#4 i think "5"
def a():
    return 5
    print(10)
print(a())

#5 i think "5" and print(x) give none 
def a():
    print(5)
x = a()
print(x)

#6 i think "38" 
def a(b,c):
    print(b+c)
print(a(1,2) + a(2,3))

#7 i think "25"
def a(b,c):
    return str(b)+str(c)
print(a(2,5))

#8 i think "10"
def a():
    b = 100
    print(b)
    if b < 10:
        return 5
    else:
        return 10
    return 7
print(a())

#9 i think first print "7" 2nd "14" 3rd "21"
def a(b,c):
    if b<c:
        return 7
    else:
        return 14
    return 3
print(a(2,3))
print(a(5,3))
print(a(2,3) + a(5,3))

#10 i think first return "8"
def a(b,c):
    return b+c
    return 10
print(a(3,5))

#11 i think "500" "500" "300" "500"
b = 500
print(b)
def a():
    b = 300
    print(b)
print(b)
a()
print(b)

#12 i think "500" "500" "300" "500"
b = 500
print(b)
def a():
    b = 300
    print(b)
    return b
print(b)
a()
print(b)

#13 i think "500" "500" "300"
b = 500
print(b)
def a():
    b = 300
    print(b)
    return b
print(b)
b=a()
print(b)

#14 i think "1" "3" "2"
def a():
    print(1)
    b()
    print(2)
def b():
    print(3)
a()

#15
def a():
    print(1)
    x = b()
    print(x)
    return 10
def b():
    print(3)
    return 5
y = a()
print(y)










