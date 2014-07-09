get.port.coordinates = function(port.name) {
  
  library(geonames)
  
  raw.result = GNsearch(name = port.name, style = "FULL", username = 'dimitrioschr')
  
  # raw.result
  raw.result$population = as.numeric(raw.result$population)
  raw.result$lng = as.numeric(raw.result$lng)
  raw.result$lat = as.numeric(raw.result$lat)
  # order by field: population
  raw.result = raw.result[order(raw.result$population, decreasing = TRUE), ]
  # View(raw.result)
  # raw.result[1, c("lng", "lat")]
  port.coordinates = data.frame(# port.name = port.name, 
                                # country = raw.result[1, "countryCode"], 
                                longitude = raw.result[1, "lng"], 
                                latitude = raw.result[1, "lat"])
  
  return(port.coordinates)
  
}