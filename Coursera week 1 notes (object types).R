ls()
x<-1
x = 2 # both "<-" and "=" can be assignment operators; depending on the context their functions are slightly different
print (x)
x
y = c(1.7,"a") # c means 'concatenate these values'. Lists are exceptions as they can contain elements of different classes/
attributes(y)
class(y)
as.numeric(y) # Coercion - forcing an object to belong to a class. Sometimes it will not be possible!
class(y)
as.logical(y)
class(y)
m = matrix(nrow=2,ncol=3)
m
dim(m) #  what dimensions does the object (matrix) m have? 
m$2
m[1,2]
m[1,]
m = matrix(1:10)
dim(m) = c(2,5)
m
z = factor (c("yes","yes","no","no","yes")) #Factors are like integer vectors, where each value has a name. Ordered and unordered categorical data
z
table(z)
levels(z) = c("yes","no") #Levels can be rearranged so that they are NOT in numerical order
z
w = data.frame(foo = 1:4, bar = c(T,T,F,F)) # data frames are used to store tabular data; a special type of list where every element of the list has to have the same length.
w
nrow(w)
row.names(w)
ncol(w)
v = 1:3
v = c(1:3)
names (v)
names(v) = c("foo", "bar", "norf") # objects can have names
names(v)
u = list(a = 1, b = 2, c = 3) # list elements can have names too
u
n = matrix (1:4, nrow = 2, ncol = 2)
dimnames(n) = list (c("a", "b"), c("d","e")) #matrices can also have names
n
-------------------------------------------------------------

#Subsetting (part 1)
t = c("a","b", "c","d","e","f","g")  #character vector called t
t[1] #single bracket operator extracts the first element
t[2] #second element of t
t[1:4] #extracting a sequence of elements 1 through to 4. Subsetting using a numeric index
t[t>"a"] #logical index returns character vector 
s = t>"a" #a true/false vector that tells which elements of vector t are>"a"
s
t[s] #prints out subset of t that is >"a"

r = matrix(1:6,2,3) # r is a matrix with values from 1 to 6 and 2 rows and 3 columns
r[1,2] # subset the element in the 1st row, 2d column. Returns a Vector NOT a 1by1 matrix. 'drop = false' preserves dimensions
r[1, ] #returns a vector with elements 1,3,5; 
r[1, ,drop = FALSE] #returns a matrix
