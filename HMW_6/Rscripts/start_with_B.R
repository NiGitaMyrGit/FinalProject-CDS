#What I basically did was merging the solutions to challenge 4 and challenge 5
#in the data-carpentry teaching website under control flow. Link:
#https://swcarpentry.github.io/r-novice-gapminder/07-control-flow/index.html

gapminder <- read.csv("gapminder_data.csv")

#since the threshold is an interval between 50:70
#a lower and upper threshold is set
lowerThreshold <- 50
upperThreshold <- 70

#grep is used to find countries starting with B using ^B
#unique() function is used to loop over each of the unique values of ‘country’
#value must be set to = TRUE in order to get the values and not just the index
candidateCountries <- grep("^B", unique(gapminder$country), value = TRUE)

#For loop begins
for (iCountry in candidateCountries) {
  tmp <- mean(gapminder[gapminder$country == iCountry, "lifeExp"])
  #tmp is used to create a temporary variable storing our input as a subset
  #mean calculates the average of the life expectancy (lifeExp) for each country
  #iCountry is used to refer to the country column in the gapminder dataset
   
  if(tmp < lowerThreshold) {
    cat("Average Life Expectancy in", iCountry, "is less than", lowerThreshold, "\n")
    #if the life expectancy is lower than 50 R will say so
  } else if(tmp > lowerThreshold && tmp < upperThreshold) {
    cat("Average Life Expectancy in", iCountry, "is between", lowerThreshold, "and", upperThreshold, "\n")
    #if the life expectancy is between 50 and 70 R will say so
  } else {
    cat("Average Life Expectancy in", iCountry, "is greater than", upperThreshold, "\n")
    #if the life expectancy is greater than 50 R will say so
  }
  rm(tmp)
}
#For loop ends
