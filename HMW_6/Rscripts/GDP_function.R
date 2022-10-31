#defining function able to calculate GDP
#done by multiplying population column (pop) GDP per capital column (gdpPercap)
 
calcGDP <- function(dat, year=NULL, country=NULL) { #NULL is the default by using year=NULL, country=NUL
  if(!is.null(year)) { #used to check whether each argument is set to null
    dat <- dat[dat$year %in% year, ] #storing non-null argument in dat
    # %in% is used in order to be able to calculate numerous years and countries
  }
  if (!is.null(country)) {
    dat <- dat[dat$country %in% country,]
  }
  gdp <- dat$pop * dat$gdpPercap #multiplying pop column with gdpPercap column
  
  new <- cbind(dat, gdp=gdp)  #the function will not change anything within the actual dataset but only within this function
  return(new)
}
