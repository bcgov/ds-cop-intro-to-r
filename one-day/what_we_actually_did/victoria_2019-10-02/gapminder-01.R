# load the readr library so we can use read_csv to read data.
# We previously installed reader using:
# install.packages("readr")
library(readr)

# read in the data from the data folder:
gapminder <- read_csv("data/gapminder_data.csv")

# use summary to look at a summary
# and str to look at the structure
summary(gapminder)
str(gapminder)

# head and tail to look at the first and last six rows respectively
head(gapminder)
tail(gapminder)

# Show the unique values in the 'continent' column
unique(gapminder$continent)

# subsetting a data frame:
# my_data_frame[rows, columns]

# Pick just the first row
gapminder[1, ]

# Pick rows 7-12
gapminder[7:12, ]

# Pick rows 8 and 136 by constructing a numeric vector with the 'c' function
gapminder[c(8, 136), ]

# Logical test to tell us which rows have "Afghaninstan" in the country column
gapminder$country == "Afghanistan"

# Now we use that same logical test to return the rows from gapminder
# where country is "Afghanistan"
gapminder[gapminder$country == "Afghanistan", ]

# Use the %in% operator to find which rows in the country column are either
# "Canada" or "Mexico" ('in the set of')
# Assign that to a variable (logical vector of TRUE/FALSE)
can_mex <- gapminder$country %in% c("Canada", "Mexico")

# Use the logical vector to subset the rows of gapminder where
# country is either "Canada" or "Mexico"
can_mex_gap <- gapminder[can_mex, ]

# Select just the columns "country" and "year" by putting a character 
# vector in the columns position of the square brackets 
# (note that there is nothing before the comma indicating 'keep all rows')
gapminder[ , c("country", "year")]

# Now use our previously constructed logical vector (can_mex)
# and a character vector to return just the rows where country is "Canada" or 
# "Mexico" and just the columns "country", "year", and "pop"
gapminder[can_mex, c("country", "year", "pop")]

# Challenge: Select from gapminder:
#   - only rows for the continent Asia
#   - with the columns "year", "pop", "gdpPercap"

# solution:
gapminder[gapminder$continent == "Asia", c("year", "pop", "gdpPercap")]

# Challenge 2: Select from gapminder:
#   - only rows from 1975 and earlier
#   - all columns

# solution:
gapminder[gapminder$year <= 1975, ]
