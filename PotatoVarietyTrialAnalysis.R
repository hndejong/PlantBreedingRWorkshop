# Code for analysis of potato variety trial data

# Before starting, ensure you are in the correct working directory!

# Import example data
pvt <- read.table(file = "data/Potato.Variety.Trial.Data.txt", 
                  skip = 1, # skip the first line of the file
                  header = T) # the file has a header (names for each column)

# Let's start by visualizing the data

#Get mean of yield for each genotype
yield_means <- aggregate(x = pvt$Yield_ton_per_ha, by = list(pvt$Genotype), FUN = "mean") 
colnames(yield_means) <- c("genotype", "yield")

# Plot yield data by genotype and location
par(mar=c(10, 5, 4, 2)) # set the margin sizes of the graph- we want the bottom margin big to fit our labels!
barplot(
        height = yield_means$yield, # this is your data, for the height of each bar
        names.arg = yield_means$genotype, # label the x-axis with these names for each bar
        ylab = "yield (ton/ha)", # label the y-axis
        #xlab = "this is the x axis",
        main = "Potato yield by genotype", # give the plot a title
        las = 2, # rotate the x-axis labels to vertical
        col = "brown" # make the bars brown
        )
mtext(text = "genotype", side = 1, line = 8) # Add an x-axis label


# Now instead, break up genotype data by location

#Get mean of yield for each genotype*location
yield_means2 <- aggregate(x = pvt$Yield_ton_per_ha, by = c(list(pvt$Genotype), list(pvt$Loc)), FUN = "mean")
colnames(yield_means2) <- c("genotype", "loc", "yield")

# Get yield means for location 1
loc1_means <- yield_means2[which(yield_means2$loc==1),]

# Get yield means for location 2
loc2_means <- yield_means2[which(yield_means2$loc==2),]

# Plot yield data by genotype and location
# There are many parameters but most are just visual- try playing around with them!
means_by_loc <- cbind(loc1_means$yield, loc2_means$yield) # put the columns for location 1 and location 2 together
                                                          # to make a table that is genotype x location
rownames(means_by_loc) <- loc1_means$genotype # add back the genotype names
colnames(means_by_loc) <- c("loc1", "loc2") # name the columns as locations
par(mar = c(10, 5, 4, 8), xpd = T) # set margins, leaving room for a legend
barplot(
        height = t(means_by_loc), # plot the data from the table you just made
        beside = T, # plot the bar for loc1 next to the bar for loc 2
        ylab = "yield (ton/ha)", # label the y-axis
        main = "Potato yield by genotype and location", # give the plot a title
        las = 2, # rotate the x-axis labels to vertical
        col = c("blue", "green") # make the bars blue and green
        )
mtext(text = "genotype", side = 1, line = 8) # Add an x-axis label
# Add a legend
legend("right", inset=c(-0.25,0), legend = colnames(means_by_loc), title="Location", fill = c("blue", "green"))

# Can save image generated as png, pdf, etc.

# Now let's run an analysis- just 2 lines!

# Run ANOVA for yield as affected by genotype, location, and rep, with an interaction term for genotype and location
av <- aov(data = pvt, formula = Yield_ton_per_ha ~ Genotype + Loc + Rep + Genotype*Loc)
# Print the summary for this ANOVA
summary(av)

# To identify which varieties are significant, we can compute a least significant difference

# Install and load the package "agricolae"- this is a piece of R software available online
install.packages("agricolae") # One time download
library("agricolae") # Every time you want to use the package

# Compute Tukey's honestly significant difference for yield by variety
HSD.test(av, "Genotype", console = T)

# Compute LSD for yield by variety
LSD.test(av, "Genotype", console = T)

# Compute Duncan's test for yield by variety
duncan.test(av, "Genotype", console = T)

