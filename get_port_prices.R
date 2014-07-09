library('stringr')

# use url of webpage
page.content = readLines('http://shipandbunker.com/prices/emea/nwe/nl-rtm-rotterdam')
# seek line including 'row-0-IFO380'
IFO380.line = grep('row-0-IFO380', page.content)
# get date of last update off the line just found
IFO380.date = unlist(str_split(
  unlist(str_split(page.content[IFO380.line], '</span> '))[2], 
  '</th>'))[1]
# get price of last update off the line immediately after the line just found
IFO380.price = unlist(str_split(
  unlist(str_split(page.content[IFO380.line + 1], '"price-IFO380\">'))[2], 
  '<span class='))[1]
page.content[IFO380.line + 1]


# IFO180.line = grep('row-0-IFO180', page.content)
# page.content[IFO180.line]
# page.content[IFO180.line + 1]
# MGO.line = grep('row-0-MGO', page.content)
# page.content[MGO.line]
# page.content[MGO.line + 1]
# LS380.line = grep('row-0-LS380', page.content)
# page.content[LS380.line]
# page.content[LS380.line + 1]
# LS180.line = grep('row-0-LS180', page.content)
# page.content[LS180.line]
# page.content[LS180.line + 1]
# LSMGO.line = grep('row-0-LSMGO', page.content)
# page.content[LSMGO.line]
# page.content[LSMGO.line + 1]
