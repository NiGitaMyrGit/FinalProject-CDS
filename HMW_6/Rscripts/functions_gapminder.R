#defining function able to calculate GDP
#done by multiplying population column with gdpperCap (GDP per capita) column
#NULL is the default by using year=NULL, country=NUL 
#!is.null() used to check whether the argument is set to null,
#the %in% is used in order to be able to calculate numerous yars and countries
#"new" is added in order not to change anything within the actual dataset, but only when using this function 

calcGDP <- function(dat, year=NULL, country=NULL) {
  if(!is.null(year)) {
    dat <- dat[dat$year %in% year, ]
  }
  if (!is.null(country)) {
    dat <- dat[dat$country %in% country,]
  }
  gdp <- dat$pop * dat$gdpPercap
  
  new <- cbind(dat, gdp=gdp)
  return(new)
}
