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

-----------------------------------------------------------------
  
#Subsetting part 2

x = list(foo = 1:4, bar = 0.6) 
x[1]                                #we can also subset lists. Single square brackets return elements that are same class as the original
x[[1]]                              #returns JUST a sequence 1 through 4; no 'list' is given.
x$bar                               #this returns the element that is associated with the name "bar"
x[["bar"]]                          #returns the same as $bar
x["bar"]                            #returns a list with the element "bar" in it
x[c(1:2)]                           #you can extract several elements of a list by passing in a numeric vector
name = "foo"
x[[name]]                           #computed index for foo
x$name                              #doesn't work!
x[[c(1,3)]]                         #extracts the third element of the first element ( a list)
x[[1]][[3]]                         #gives the same result

y = list(aardvark = 1:5)
y$a                                 #Partial matching is ok with $
y[["a"]]                            #doesn't work
y[["a", exact = FALSE]]             #this works
z = c(1,2,NA,4,NA,6)                #How do we remove these NAs?
bad = is.na(z)                      #Create a boolean called "bad" that includes all NA elements in z
z[!bad]                             #Then create a subset of z that is not NA

m = c(1,2,NA,4,NA,7)
n = c(5,6,NA,NA,7,8)                #What if we want to subset from multiple objects?
good = complete.cases (m,n)         #Use complete.cases function on both vectors
good                                #Now this vector returns a boolean vector of all of the non-missing elelemnts of both lists
m[good]                             #This returns a subset of all the good elements in m
n[good]
-------------------------------------------------------------------------------

  #Reading and writing data part 1
  
read.table
read.csv                            #read text files that have data in rows and columns; return a data frame in R (inverse of write.table)
readLines                           #For reading lines of a text file, gives caharacter vector (inverse of writeLines)
source                              #for reading code in R (inverse of dump)
dget                                #for reading R code that has been deparsed (inverse of dput)
load                                #for reading in saved work spaces (inverse of save)
unserialize                         #for reading single R objects in binary form (inverse of serialize)

data = read.table("foo".txt)        #for small to medium sized datasets, you will not need to specify any arguments
help(read.table)                    #learn this so you can recite this in your sleep!
 
initial = read.table("datatable.txt", nrows = 100)           #A quick and dirty way of figuring out the classes of each column - take just part of the dataset
classes = sapply(initial, class)                             #now loop over each column using sapply function to read classes from the initial dataset
tabAll = read.table ("datatable.txt", colClasses = classes)   #now read through the entire dataset, setting colClasses to classes



