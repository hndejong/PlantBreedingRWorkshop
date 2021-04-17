######Exercise 1 (Scalar variables)

# Set variable x to 5
x <- 5
# Set variable y to 4
y <- 4

# Add x and y together
x + y

# Find the square root of y
sqrt(y)

# Find the cube of x
x^3

# YOUR TURN

# Set variable z to 20

# Find the value of z minus y, and store it to the variable a

# Find the value of z divided by x

######Exercise 2 (Vectors and matrices)

# Create a vector called "vals" that stores the values: 6, 2, 3, 4
vals = c(6, 2, 3, 4)
# Display it
vals

# Create a vector called "repetition" that stores four copies of the value 3
repetition <- rep(3, 4)
# Display it
repetition

# Create a vector called "counting" that stores the values 1 through 10
counting <- 1:10
# Display it
counting

# Find the mean of the vector "vals"
mean(vals)

# Display the third element of "vals"
vals[3]

# Add 2 to each element of "counting" and store it in the new vector "counting_higher"
counting_higher = counting + 2
# Display it
counting_higher

# Create a matrix named m with the values 6,5,4,3,2,1 in two rows
m <- matrix(data = c(6,5,4,3,2,1), nrow = 2, byrow = T)
# Display it
m
# Display the element in the first row and third column of m
m[1,3]
# Display only the second row of m
m[2,]
# Display only the first column of m
m[,1]

# YOUR TURN

# Create a vector called "threes" that countains the first 5 multiples of 3

# Find the mean of the vector "threes

# Display the fourth element of "threes"

# Create a matrix called "mat" of all zeroes, with 5 rows and 3 columns

# Change the value in the second row and second column to a 7

######Exercise 3 (Data frames)

# Create a data frame with some names, ages, and sexes of people
df <- data.frame(name = c("Ahmed", "Beleke", "Dani", "Eshe", "Firew"), age = c(24, 57, 33, 50,  42), sex = c("M", "M", "F", "F", "M"), stringsAsFactors = F)
# Display it
df

# Display the column of names
df$name

# Find the mean age
mean(df$age)

# Find the mean age of the males and females separately
# For this we will use the "aggregate" function
aggregate(x = df$age, by = list(df$sex), FUN = mean)

# YOUR TURN

# Let's collect some data from the group, and fill in the command below
# Data to collect: name, primary crop, and number of years worked with that crop
group_crops <- data.frame(name = c(), crop = c(), num_years_crop = c())

# Display the whole data frame
group_crops

# Find the median number of years people in this group have worked with their crop


# Find the mean number of years for the people who work with potato

######Exercise 4 (Reading and writing to files)

# Make sure to set your working directory to the correct location!

# Read in the file named "orange_tree_growth.txt" and name the data frame "orange"
orange <- read.table(
          file = "data/orange_tree_growth.txt", # name of file to read
          sep = "\t", # the data in the file are separated by tabs
          header = T # the data has a header
)

# Write the data frame df to a file called "example.txt"
write.table(
  df, # this is the data you are writing
  file = "example.txt", # this is the name of the file to write to
  sep = "\t", # data will be separated by tabs
  quote = F, # do not put quotes around the data
  row.names = F # do not include row names in the file
)

# YOUR TURN

# Read in the file named "island_areas.csv"
# Make sure to look at the file first, to see the formatting!

# View this data

# Write the data frame that we generated (group_crops) to a file named "group_crops.txt"

######Exercise 5 (Plotting)

# Let's use one of R's built in datasets, on flow volumes of the Nile

# View this dataset
Nile

# Make a histogram of this dataset
hist(Nile)

# Now let's use another built in R data set on Insect Sprays

# Display this data set and look it over
InsectSprays

# Compute the means of each count by spray type
spraymeans <- aggregate(x = InsectSprays$count, by = list(InsectSprays$spray), FUN = mean)

# Let's rename the columns
colnames(spraymeans) <- c("spray", "count_mean")

# Make a barplot of these means
barplot(
  spraymeans$count_mean, # values to be plotted
  names.arg = spraymeans$spray, # names for each bar
  xlab = "Spray", # label x axis
  ylab = "Mean count", # label y axis
  main = "Mean count by spray type" # label main title
  )

# YOUR TURN

# Let's use the built in R dataset called DNase, 
# which gives ELISA values (optical densities) for different concentrations of DNAse enzyme

# View this data set 
DNase

# Make a scatterplot of density vs. concentration (ignore run number for now)
# Hint: use the function called "plot"


