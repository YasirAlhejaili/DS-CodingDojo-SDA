# 1. TASK: print "Hello World"

print( "Hello World" )

# 2. print "Hello Yasir!" with the name in a variable

name = "Yasir"
print( "Hello" , name , "!" )   # with a comma
print("Hello" + name + "!") # with a +

# 3. print "Hello 42!" with the number in a variable

number = 42
print("Hello" , number , "!")   # with a comma
print("Hello" + number + "!")   # with a +  -- this one should give us an error!
#TypeError: can only concatenate str (not "int") to str

# 4. print "I love to eat sushi and pizza." with the foods in variables

fave_food1 = "sushi"
fave_food2 = "pizza"
print("I love to eat {} and {}".format(fave_food1 , fave_food2)) # with .format()
print(f"I love to eat {fave_food1} and {fave_food2} ") # with an f string

# More practice

hw = "Hello %s" % "World"
py = "I love Python %d" % 3 
print(hw, py)


f_name = "Yasir"
l_name = "Alhejaili"
age = 24
x = "hello world"
print("My name is %s %s and I'm %d" % (f_name, l_name , age))

print(x.title())

print(x.upper())

print(x.lower())

print(x.join(f_name))

