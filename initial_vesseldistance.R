require(XML)
require(httr)

basePage = 'http://www.vesseldistance.com'
h = handle(basePage)
res = GET(handle = h, path = 
            '/?user=dimitrioschr&pass=jimakos1&fromLon=9.9&fromLat=53.34&toLon=47&toLat=11&speed=20&startTime=1&numOfRoutes=ONE')

# content(res, as = 'text')
xml <- xmlInternalTreeParse(content(res, as = 'text'))




