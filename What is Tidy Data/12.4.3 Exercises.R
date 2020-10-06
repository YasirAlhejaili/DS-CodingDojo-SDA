# 12.4.3 Exercises

tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% 
  separate(x, c("one", "two", "three"))

# Q1 : What do the extra and fill arguments do in separate()?
# Ans 1 : fill : If sep is a character vector, this controls what happens when there are not enough pieces
# Ans 1 : extra : If sep is a character vector, this controls what happens when there are too many pieces
# Q2 : Both unite() and separate() have a remove argument. What does it do?
# Ans 2 : unite() : Convenience function to paste together multiple columns into one
# Ans 2 : separate() turns a single character column into multiple columns
# Q3 : Compare and contrast separate() and extract() 
# Ans 3 : separate() turns a single character column into multiple columns
# Ans 3 : extract() Extract the character into multiple columns using regular expression groups
