library(XML)


page = readLines('http://www.bunkerworld.com/prices/region/nap/')
bunkers.table = readHTMLTable(page, header=F,stringsAsFactors=F)
length(bunkers.table)
bunkers.table[[1]]
bunkers.table[[2]]
bunkers.table[[3]]
bunkers.table[[4]]
bunkers.table[[5]]


'http://www.bunkerworld.com/prices/port/nz/akl/'
'http://www.bunkerworld.com/prices/port/kr/pus/'
'http://www.bunkerworld.com/prices/port/es/521/'
'http://www.bunkerworld.com/prices/port/lk/cmb/'
'http://www.bunkerworld.com/prices/port/ae/fjr/'
'http://www.bunkerworld.com/prices/port/it/goa/'
'http://www.bunkerworld.com/prices/port/ec/gye/'
'http://www.bunkerworld.com/prices/port/us/hou/'
'http://www.bunkerworld.com/prices/port/us/lax/'
'http://www.bunkerworld.com/prices/port/uy/mvd/'
'http://www.bunkerworld.com/prices/port/us/nyc/'
'http://www.bunkerworld.com/prices/port/nl/rtm/'
'http://www.bunkerworld.com/prices/port/sg/sin/'
''