source('~/NewBunker/get.period.table.R')
source('~/NewBunker/get.spot.table.R')

period.2014 = get.period.table('C:\\Users\\operation2\\Desktop\\2014period.csv')
period.2013 = get.period.table('C:\\Users\\operation2\\Desktop\\2013period.csv')
period.2012 = get.period.table('C:\\Users\\operation2\\Desktop\\2012period.csv')
period.2011 = get.period.table('C:\\Users\\operation2\\Desktop\\2011period.csv')

spot.2014 = get.spot.table('C:\\Users\\operation2\\Desktop\\2014spot.csv')
spot.2013 = get.spot.table('C:\\Users\\operation2\\Desktop\\2013spot.csv')
spot.2012 = get.spot.table('C:\\Users\\operation2\\Desktop\\2012spot.csv')
spot.2011 = get.spot.table('C:\\Users\\operation2\\Desktop\\2011spot.csv')

# prices along the timeline: prices have dropped and stabilised
hist(period.2011$rate, xlim = c(0, 30000), ylim = c(0, 175), density = 30, col = 'lightgrey')
hist(period.2012$rate, add = TRUE, density = 20, col = 'steelblue')
hist(period.2013$rate, add = TRUE, density = 10, col = 'lightblue')
hist(period.2014$rate, add = TRUE, density = 5, col = 'darkblue')

# period market histograms: younger ships get snapped up more often
hist(period.2011$built, breaks = 1985:2015, density = 5, col = 'lightgrey')
hist(period.2012$built, breaks = 1985:2015, density = 10, col = 'lightblue', add = TRUE)
hist(period.2013$built, breaks = 1985:2015, density = 20, col = 'steelblue', add = TRUE)
hist(period.2014$built, breaks = 1985:2015, density = 30, add = TRUE)

# spot market histograms: younger ships get snapped up more often
hist(spot.2011$built, breaks = 1980:2015, density = 5, col = 'lightgrey')
hist(spot.2012$built, breaks = 1980:2015, density = 10, col = 'lightblue', add = TRUE)
hist(spot.2013$built, breaks = 1960:2015, density = 20, col = 'steelblue', add = TRUE)
hist(spot.2014$built, breaks = 1980:2015, density = 30, add = TRUE)

# period market: duration vs. built
hist(period.2011$duration.min, breaks = 0:40, freq = FALSE, ylim = c(0, 0.35), density = 1)
hist(period.2012$duration.min, breaks = 0:40, freq = FALSE, add = TRUE, col = 'lightgrey', density = 10)
hist(period.2013$duration.min, breaks = 0:40, freq = FALSE, add = TRUE, col = 'lightblue', density = 20)
hist(period.2014$duration.min, breaks = 0:40, freq = FALSE, add = TRUE, col = 'steelblue', density = 30)

hist(period.2011$built[period.2011$duration.min < 6], breaks = 1980:2015)
hist(period.2011$built[period.2011$duration.min >= 6 & 
                         period.2011$duration.min < 12], 
     add = TRUE, col = 'lightblue', breaks = 1980:2015)
hist(period.2011$built[period.2011$duration.min >= 12], 
     add = TRUE, col = 'darkblue', density = 20, breaks = 1980:2015)

hist(period.2012$built[period.2012$duration.min < 6], breaks = 1980:2015)
hist(period.2012$built[period.2012$duration.min >= 6 & 
                         period.2012$duration.min < 12], 
     add = TRUE, col = 'lightblue', breaks = 1980:2015)
hist(period.2012$built[period.2012$duration.min >= 12], 
     add = TRUE, col = 'darkblue', density = 20, breaks = 1980:2015)

hist(period.2013$built[period.2013$duration.min < 6], breaks = 1980:2015)
hist(period.2013$built[period.2013$duration.min >= 6 & 
                         period.2013$duration.min < 12], 
     add = TRUE, col = 'lightblue', breaks = 1980:2015)
hist(period.2013$built[period.2013$duration.min >= 12], 
     add = TRUE, col = 'darkblue', density = 20, breaks = 1980:2015)

hist(period.2014$built[period.2014$duration.min < 6], breaks = 1980:2015)
hist(period.2014$built[period.2014$duration.min >= 6 & 
                         period.2014$duration.min < 12], 
     add = TRUE, col = 'lightblue', breaks = 1980:2015)
hist(period.2014$built[period.2014$duration.min >= 12], 
     add = TRUE, col = 'darkblue', density = 20, breaks = 1980:2015)








plot(fix.data.frame$built, fix.data.frame$rate)
plot(fix.data.frame$dwt, fix.data.frame$rate)
hist(fix.data.frame$duration.min, breaks = 0:37, col = 'lightblue')
hist(fix.data.frame$duration.max, breaks = 0:37, col = 'steelblue', 
     density = 25, add = TRUE)

plot(fix.data.frame$built, fix.data.frame$duration.min)
points(fix.data.frame$built, fix.data.frame$duration.max, col = 'red')


par(mfrow = c(2,3))

for (month in month.abb) {
  month.index = which(months(fix.data.frame$date, abbreviate = TRUE) == month)
  if (length(month.index) != 0) {
    plot(fix.data.frame$built[month.index], fix.data.frame$rate[month.index], main = month)
    lin = lm(fix.data.frame$rate[month.index] ~ fix.data.frame$built[month.index])
    abline(lin, col = 'red', lwd = 5)
    print(month)
    print(coefficients(lin))
    
    hist(fix.data.frame$built[month.index], breaks = 1990:2015, main = month)
  }
}
