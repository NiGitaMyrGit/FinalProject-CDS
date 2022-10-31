#this script is used to loop over each country, find the ones that start with M
#and make a graph that plots life expectancy (lifeExp) agains time (year) 
# if mean expectancy is under 50

#we only want countries with lifeExp under 50 so the thres hold is set
thresholdValue <- 50

candidateCountries <- grep("^M", unique(gapminder$country), value = TRUE)
#grep is used to find countries starting with M using ^M
#unique() function is used to loop over each of the unique values of ‘country’
#value must be set to = TRUE in order to get the values and not just the index

for (iCountry in candidateCountries) {
  tmp <- mean(gapminder[gapminder$country == iCountry, "lifeExp"])
  #tmp is used to create a temporary variable storing our input as a subset
  #mean calculates the average of the life expectancy (lifeExp) for each country
  #iCountry is used to refer to the country column in the gapminder dataset
  
  if (tmp < thresholdValue) {
    cat("Average Life Expectancy in", iCountry, "is less than", thresholdValue, "plotting life expectancy graph... \n")
    #if the life expectancy is lower than 50 R state it's making a plot
    with(subset(gapminder, country == iCountry), 
         #with states what input we want in the graph
         plot(year, lifeExp, #year is on the x-axis, lifeExp on the y-axis
              type = "o", #creates a line between the plotted dots
              main = paste("Life Expectancy in", iCountry, "over time"),
              ylab = "Life Expectancy", #naming the y-axis
              xlab = "Year" #naming the x-axis
         ) # end of plot
    ) # end with
  } # end if
  rm(tmp)
} #end of for loop