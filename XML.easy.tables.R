require(XML)
require(stringr)

page = 'http://www.bunkerportsnews.com/PortDetails.aspx?ElementID=3b5396d2-d11b-4cc6-83e9-0112b568a6ae'
bunkers.table = readHTMLTable(page, header=F, which=3,stringsAsFactors=F)


page = 'http://www.bunkerportsnews.com/BunkerPrices.aspx?ElementID=1577b498-8302-4be7-ba8f-0e7e907eba9a'
bunkers.table = readHTMLTable(page, header=F, which=2,stringsAsFactors=F)

bunkers.table

page = 'http://navigatemag.ru/bunker/0'
bunkers.table = readHTMLTable(page, header=F, which=1,stringsAsFactors=F)
bunkers.table = bunkers.table[15:26, ]
page = 'http://navigatemag.ru/bunker/1'
bunkers.table = readHTMLTable(page, header=F, which=1,stringsAsFactors=F)
bunkers.table = bunkers.table[15:52, ]
page = 'http://navigatemag.ru/bunker/2'
bunkers.table = readHTMLTable(page, header=F, which=1,stringsAsFactors=F)
bunkers.table = bunkers.table[15:41, ]
page = 'http://navigatemag.ru/bunker/3'
bunkers.table = readHTMLTable(page, header=F, which=1,stringsAsFactors=F)
bunkers.table = bunkers.table[15:38, ]
page = 'http://navigatemag.ru/bunker/4'
bunkers.table = readHTMLTable(page, header=F, which=1,stringsAsFactors=F)
bunkers.table = bunkers.table[15:33, ]
page = 'http://navigatemag.ru/bunker/5'
bunkers.table = readHTMLTable(page, header=F, which=1,stringsAsFactors=F)
bunkers.table = bunkers.table[15:75, ]


page = 'http://www.bunkerindex.com/prices/portfree_x380mdo.php?port_id=184'
bunkers.table = readHTMLTable(page, header=F,stringsAsFactors=F)
bunkers.table[[12]]



page = 'http://www.wilhelmsen.com/services/maritime/companies/wpmf/TradingandHedging/Pages/Prices.aspx'
bunkers.table = readHTMLTable(page, header=F,stringsAsFactors=F)
check = bunkers.table[[4]][7:36, ]


bunkers.table = readHTMLTable('view-source www.bunkerworld.com prices pricematch index.php.htm', 
                              header=F,which = 1, stringsAsFactors=F)
rows = which(str_detect(bunkers.table[, 2], 'onmouseover="BWPriceMatch.pricematchPopover'))

bunkers.table[rows, 2]



page = 'http://www.bunkerworld.com/prices/port/us/hou/'
bunkers.table = readHTMLTable(page, header=F,stringsAsFactors=F)
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
