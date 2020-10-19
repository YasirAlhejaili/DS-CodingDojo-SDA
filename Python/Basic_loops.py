# Print all integers from 0 to 150

for x in range(0 , 151 , 1) : 
    print(x)
    
#  Print all the multiples of 5 from 5 to 1,000

cout = 0
while cout < 200:
    cout = cout+1 
    y = cout*5 
    print(y)
    
# Print integers 1 to 100. If divisible by 5, print "Coding" instead. If divisible by 10, print "Coding Dojo"

five = 5 
ten = 10
for i in range(1 , 101 , 1):
    
    if (i % five == 0 and i % ten != 0) :
        print("Coding")
        
    elif (i % five != 0) :
        print(i)

    if (i % ten == 0) : 
            print("Coding Dojo")
            
# Add odd integers from 0 to 500,000, and print the final sum

cout_o = 0
odd = []
while cout_o < 500000:
    cout_o = cout_o + 1
    if (cout_o % 2 == 1 ):
        
        odd.append(cout_o)
                
    if (cout_o == 500000):
        print(sum(odd))
        
# Print positive numbers starting at 2018, counting down by fours

num = 2018

while num > 0 :
    if (num > 0):
        print(num)
        num = num - 4
        
# Set three variables: lowNum, highNum, mult. Starting at lowNum and going through highNum, print only the integers that are a multiple of mult.

lowNum = 0
highNum = 20
mult = 2

counter = 0
while counter <= highNum : 
    counter = counter + 1
    counter1 = counter
    counter1 = counter1 * mult
    print(counter1)
    if (counter1 >= highNum):
        break
    

    

    

    


        


        
        
        
    

         
        
        
        



    
            

    
    
    


    