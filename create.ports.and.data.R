source('~/Documents/RStudio/BunkerPrices/create.port.list.R')
source('~/Documents/RStudio/BunkerPrices/get.port.coordinates.R')

ports.and.data = create.port.list()
# View(ports.and.data)

ports.length = dim(ports.and.data)[1]
ports.and.data = cbind(ports.and.data, longitude =  1:ports.length, latitude = 1:ports.length)

for (i in 1:ports.length) {
  ports.and.data[i, c('longitude', 'latitude')] = get.port.coordinates(ports.and.data$port.name[i])
}

# manual override of missing and wrong coordinates
for (i in 1:ports.length) {
  if (ports.and.data[i,1] == 'Norfolk VA') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-76.20, 36.92)
  }
  if (ports.and.data[i,1] == 'Quebec') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-71.22, 46.82)
  }
  if (ports.and.data[i,1] == 'Balboa, Panama') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-79.57, 8.95)
  }
  if (ports.and.data[i,1] == 'Cristobal, Panama') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-79.90, 9.35)
  }
  if (ports.and.data[i,1] == 'Freeport') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-78.70, 26.53)
  }
  if (ports.and.data[i,1] == 'Guaranao Bay') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-70.22, 11.67)
  }
  if (ports.and.data[i,1] == 'St Eustatius') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-62.97, 17.48)
  }
  if (ports.and.data[i,1] == 'Buenos Aires') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-58.38, -34.60)
  }
  if (ports.and.data[i,1] == 'Salvador') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-38.48, -12.97)
  }
  if (ports.and.data[i,1] == 'San Lorenzo') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-60.73, -32.75)
  }
  if (ports.and.data[i,1] == 'San Nicolás') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-60.13, -33.19)
  }
  if (ports.and.data[i,1] == 'Santos') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-46.33, -23.94)
  }
  if (ports.and.data[i,1] == 'Suape') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-34.97, -8.40)
  }
  if (ports.and.data[i,1] == 'Vila de Conde') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-48.45, -1.33)
  }
  if (ports.and.data[i,1] == 'Bergen') {
    ports.and.data[i, c('longitude', 'latitude')] = c(5.33, 60.39)
  }
  if (ports.and.data[i,1] == 'Gibraltar') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-5.35, 36.14)
  }
  if (ports.and.data[i,1] == 'Kali Limenes') {
    ports.and.data[i, c('longitude', 'latitude')] = c(24.83, 34.93)
  }
  if (ports.and.data[i,1] == 'Off- Angola') {
    ports.and.data[i, c('longitude', 'latitude')] = c(13.33, -8.83)
  }
  if (ports.and.data[i,1] == 'Off- Congo') {
    ports.and.data[i, c('longitude', 'latitude')] = c(11.99, -5.88)
  }
  if (ports.and.data[i,1] == 'Suao') {
    ports.and.data[i, c('longitude', 'latitude')] = c(121.85, 24.60)
  }
  if (ports.and.data[i,1] == 'Vostochny Port') {
    ports.and.data[i, c('longitude', 'latitude')] = c(133.08, 42.74)
  }
  if (ports.and.data[i,1] == 'Jawaharlal (JNPT)') {
    ports.and.data[i, c('longitude', 'latitude')] = c(72.57, 18.57)
  }
  if (ports.and.data[i,1] == 'Port Gwadar') {
    ports.and.data[i, c('longitude', 'latitude')] = c(62.32, 25.13)
  }
  if (ports.and.data[i,1] == 'Rozi') {
    ports.and.data[i, c('longitude', 'latitude')] = c(72.15, 21.76)
  }
  if (ports.and.data[i,1] == 'Vadinar') {
    ports.and.data[i, c('longitude', 'latitude')] = c(69.72, 22.40)
  }
  if (ports.and.data[i,1] == 'Hamilton') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-64.75, 32.25)
  }
  if (ports.and.data[i,1] == 'New York') {
    ports.and.data[i, c('longitude', 'latitude')] = c(-74, 40.71)
  }
}
 ports.and.data
