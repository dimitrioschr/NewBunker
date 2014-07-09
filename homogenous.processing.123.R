bunkerindex.table.new = get.bunkerindex.prices()
bunkerportsnews.table.new = get.bunkerportsnews.prices.from.summary()
marine.news.table.new = get.marine.news.prices()
navigatemag.table.new = get.navigatemag.prices()
shipandbunker.table.new = get.shipandbunker.prices.fast()

load('port_directory.table')

###########################################################################

bunkerindex.table.new.lookup = list()
length(bunkerindex.table.new.lookup) = 
  length(bunkerindex.table.new$port)

for (i in 1:length(bunkerindex.table.new$port)) {
  lookup.value = which(port_directory.table$port == bunkerindex.table.new$port[i])
  if (!(length(lookup.value) == 0)) {
    bunkerindex.table.new.lookup[[i]] = lookup.value
  } else {
    bunkerindex.table.new.lookup[[i]] = NA
  }
}

bunkerindex.table.new.lookup

which(sapply(bunkerindex.table.new.lookup, length) > 1)
which(sapply(bunkerindex.table.new.lookup, 
             function(x) {ifelse(length(x) == 1, 
                                 yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
                                 no = FALSE)}) == 1)






bunkerindex.lookup = vector('numeric', 
                            length(bunkerindex.table.new.lookup))

for (i in 1:length(bunkerindex.table.new.lookup)) {
  if (length(bunkerindex.table.new.lookup[[i]]) > 1) {
    bunkerindex.lookup[i] = 9999
  } else if (is.na(bunkerindex.table.new.lookup[[i]])) {
    bunkerindex.lookup[i] = 0
  } else {
    bunkerindex.lookup[i] = bunkerindex.table.new.lookup[[i]]
  }
}

sum(bunkerindex.lookup == 0)
which(bunkerindex.lookup == 0)
bunkerindex.table.new$port[which(bunkerindex.lookup == 0)]
sum(bunkerindex.lookup == 9999)
which(bunkerindex.lookup == 9999)
bunkerindex.table.new$port[which(bunkerindex.lookup == 9999)]






###########################################################################

bunkerportsnews.table.new = 
  bunkerportsnews.table.new[bunkerportsnews.table.new$has.prices == TRUE, ]


bunkerportsnews.table.new.lookup = list()
length(bunkerportsnews.table.new.lookup) = 
  length(bunkerportsnews.table.new$port)

for (i in 1:length(bunkerportsnews.table.new$port)) {
  lookup.value = which(port_directory.table$port == bunkerportsnews.table.new$port[i])
  if (!(length(lookup.value) == 0)) {
    bunkerportsnews.table.new.lookup[[i]] = lookup.value
  } else {
    bunkerportsnews.table.new.lookup[[i]] = NA
  }
}

bunkerportsnews.table.new.lookup

which(sapply(bunkerportsnews.table.new.lookup, length) > 1)
which(sapply(bunkerportsnews.table.new.lookup, 
             function(x) {ifelse(length(x) == 1, 
                                 yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
                                 no = FALSE)}) == 1)

bunkerportsnews.lookup = vector('numeric', 
                                length(bunkerportsnews.table.new.lookup))

for (i in 1:length(bunkerportsnews.table.new.lookup)) {
  if (length(bunkerportsnews.table.new.lookup[[i]]) > 1) {
    bunkerportsnews.lookup[i] = 9999
  } else if (is.na(bunkerportsnews.table.new.lookup[[i]])) {
    bunkerportsnews.lookup[i] = 0
  } else {
    bunkerportsnews.lookup[i] = bunkerportsnews.table.new.lookup[[i]]
  }
}

sum(bunkerportsnews.lookup == 0)
which(bunkerportsnews.lookup == 0)
bunkerportsnews.table.new$port[which(bunkerportsnews.lookup == 0)]
sum(bunkerportsnews.lookup == 9999)
which(bunkerportsnews.lookup == 9999)
bunkerportsnews.table.new$port[which(bunkerportsnews.lookup == 9999)]

bunkerportsnews.lookup[18] = 3448
bunkerportsnews.lookup[46] = NA
bunkerportsnews.lookup[56] = 4364
bunkerportsnews.lookup[57] = 3805
bunkerportsnews.lookup[63] = 2963
bunkerportsnews.lookup[70] = 2636
bunkerportsnews.lookup[81] = 2636
bunkerportsnews.lookup[90] = 1670
bunkerportsnews.lookup[95] = 2640
bunkerportsnews.lookup[96] = 2640
bunkerportsnews.lookup[97] = 2680
bunkerportsnews.lookup[101] = 2636
bunkerportsnews.lookup[105] = 848
bunkerportsnews.lookup[106] = 3107
bunkerportsnews.lookup[107] = 2177
bunkerportsnews.lookup[109] = 3363
bunkerportsnews.lookup[111] = 3506
bunkerportsnews.lookup[115] = 2636
bunkerportsnews.lookup[116] = 2640
bunkerportsnews.lookup[119] = 4231
bunkerportsnews.lookup[120] = 1
bunkerportsnews.lookup[124] = 2706
bunkerportsnews.lookup[137] = 1108
bunkerportsnews.lookup[148] = 3818
bunkerportsnews.lookup[156] = 2433

bunkerportsnews.lookup[26] = 2024
bunkerportsnews.lookup[36] = 1209 
bunkerportsnews.lookup[49] = 672
bunkerportsnews.lookup[52] = 1993
bunkerportsnews.lookup[53] = 3516
bunkerportsnews.lookup[67] = 2640
bunkerportsnews.lookup[161] = 3910

c1 = as.character(bunkerportsnews.table.new$port)
c2 = as.character(port_directory.table$port[bunkerportsnews.lookup])
c3 = as.character(port_directory.table$country[bunkerportsnews.lookup])
c4 = port_directory.table$longitude[bunkerportsnews.lookup]
c5 = port_directory.table$latitude[bunkerportsnews.lookup]
c6 = na.omit(data.frame(
  port = c1, pd.port = c2, pd.country = c3, 
  longitude = c4, latitude = c5, stringsAsFactors = FALSE))

bunkerportsnews.lookup = c6
save(bunkerportsnews.lookup, file = 'bunkerportsnews.lookup')


###########################################################################

navigatemag.table.new.lookup = list()
length(navigatemag.table.new.lookup) = 
  length(navigatemag.table.new$port)

for (i in 1:length(navigatemag.table.new$port)) {
  lookup.value = which(port_directory.table$port == navigatemag.table.new$port[i])
  if (!(length(lookup.value) == 0)) {
    navigatemag.table.new.lookup[[i]] = lookup.value
  } else {
    navigatemag.table.new.lookup[[i]] = NA
  }
}

navigatemag.table.new.lookup

which(sapply(navigatemag.table.new.lookup, length) > 1)
which(sapply(navigatemag.table.new.lookup, 
             function(x) {ifelse(length(x) == 1, 
                                 yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
                                 no = FALSE)}) == 1)



navigatemag.lookup = vector('numeric',
                            length(navigatemag.table.new.lookup))

for (i in 1:length(navigatemag.table.new.lookup)) {
  if (length(navigatemag.table.new.lookup[[i]]) > 1) {
    navigatemag.lookup[i] = 9999
  } else if (is.na(navigatemag.table.new.lookup[[i]])) {
    navigatemag.lookup[i] = 0
  } else {
    navigatemag.lookup[i] = navigatemag.table.new.lookup[[i]]
  }
}



sum(navigatemag.lookup == 0)
which(navigatemag.lookup == 0)
navigatemag.table.new$port[which(navigatemag.lookup == 0)]
sum(navigatemag.lookup == 9999)
which(navigatemag.lookup == 9999)
navigatemag.table.new$port[which(navigatemag.lookup == 9999)]


navigatemag.lookup[10] = 4364
navigatemag.lookup[13] = NA
navigatemag.lookup[21] = 2963
navigatemag.lookup[22] = 3055
navigatemag.lookup[23] = 2829
navigatemag.lookup[24] = 3376
navigatemag.lookup[34] = 548
navigatemag.lookup[47] = 4225
navigatemag.lookup[50] = 3913
navigatemag.lookup[60] = 3448
navigatemag.lookup[62] = 1618
navigatemag.lookup[81] = 2433
navigatemag.lookup[88] = 3561
navigatemag.lookup[93] = 2636
navigatemag.lookup[101] = 2640
navigatemag.lookup[112] = 1670
navigatemag.lookup[118] = 2640
navigatemag.lookup[119] = 2640
navigatemag.lookup[124] = 2636
navigatemag.lookup[128] = 1
navigatemag.lookup[129] = NA
navigatemag.lookup[130] = 848
navigatemag.lookup[132] = 2177
navigatemag.lookup[134] = 3364
navigatemag.lookup[136] = 3506
navigatemag.lookup[141] = 2640

navigatemag.lookup[7] = 672
navigatemag.lookup[14] = 1863
navigatemag.lookup[28] = 3516
navigatemag.lookup[82] = 2024
navigatemag.lookup[90] = 2640
navigatemag.lookup[131] = 3107
navigatemag.lookup[145] = 4230
 
  
c1 = as.character(navigatemag.table.new$port)
c2 = as.character(port_directory.table$port[navigatemag.lookup])
c3 = as.character(port_directory.table$country[navigatemag.lookup])
c4 = port_directory.table$longitude[navigatemag.lookup]
c5 = port_directory.table$latitude[navigatemag.lookup]
c6 = na.omit(data.frame(
  port = c1, pd.port = c2, pd.country = c3, 
  longitude = c4, latitude = c5, stringsAsFactors = FALSE))

navigatemag.lookup = c6
save(navigatemag.lookup, file = 'navigatemag.lookup')



###########################################################################

marine.news.table.new.lookup = list()
length(marine.news.table.new.lookup) = 
  length(marine.news.table.new$port)

for (i in 1:length(marine.news.table.new$port)) {
  lookup.value = which(port_directory.table$port == marine.news.table.new$port[i])
  if (!(length(lookup.value) == 0)) {
    marine.news.table.new.lookup[[i]] = lookup.value
  } else {
    marine.news.table.new.lookup[[i]] = NA
  }
}

marine.news.table.new.lookup

which(sapply(marine.news.table.new.lookup, length) > 1)
which(sapply(marine.news.table.new.lookup, 
             function(x) {ifelse(length(x) == 1, 
                                 yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
                                 no = FALSE)}) == 1)




marine.news.lookup = vector('numeric',
                            length(marine.news.table.new.lookup))

for (i in 1:length(marine.news.table.new.lookup)) {
  if (length(marine.news.table.new.lookup[[i]]) > 1) {
    marine.news.lookup[i] = 9999
  } else if (is.na(marine.news.table.new.lookup[[i]])) {
    marine.news.lookup[i] = 0
  } else {
    marine.news.lookup[i] = marine.news.table.new.lookup[[i]]
  }
}



sum(marine.news.lookup == 0)
which(marine.news.lookup == 0)
marine.news.table.new$port[which(marine.news.lookup == 0)]
sum(marine.news.lookup == 9999)
which(marine.news.lookup == 9999)
marine.news.table.new$port[which(marine.news.lookup == 9999)]


marine.news.lookup[1] = 3910
marine.news.lookup[42] = 1209
  
marine.news.lookup[9] = 3818
marine.news.lookup[35] = 1993
marine.news.lookup[36] = 3179


c1 = as.character(marine.news.table.new$port)
c2 = as.character(port_directory.table$port[marine.news.lookup])
c3 = as.character(port_directory.table$country[marine.news.lookup])
c4 = port_directory.table$longitude[marine.news.lookup]
c5 = port_directory.table$latitude[marine.news.lookup]
c6 = na.omit(data.frame(
  port = c1, pd.port = c2, pd.country = c3, 
  longitude = c4, latitude = c5, stringsAsFactors = FALSE))

marine.news.lookup = c6
save(marine.news.lookup, file = 'marine.news.lookup')




###########################################################################

shipandbunker.table.new.lookup = list()
length(shipandbunker.table.new.lookup) = 
  length(shipandbunker.table.new$port)

for (i in 1:length(shipandbunker.table.new$port)) {
  lookup.value = which(port_directory.table$port == shipandbunker.table.new$port[i])
  if (!(length(lookup.value) == 0)) {
    shipandbunker.table.new.lookup[[i]] = lookup.value
  } else {
    shipandbunker.table.new.lookup[[i]] = NA
  }
}

shipandbunker.table.new.lookup

which(sapply(shipandbunker.table.new.lookup, length) > 1)
which(sapply(shipandbunker.table.new.lookup, 
             function(x) {ifelse(length(x) == 1, 
                                 yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
                                 no = FALSE)}) == 1)






shipandbunker.lookup = vector('numeric',
                            length(shipandbunker.table.new.lookup))

for (i in 1:length(shipandbunker.table.new.lookup)) {
  if (length(shipandbunker.table.new.lookup[[i]]) > 1) {
    shipandbunker.lookup[i] = 9999
  } else if (is.na(shipandbunker.table.new.lookup[[i]])) {
    shipandbunker.lookup[i] = 0
  } else {
    shipandbunker.lookup[i] = shipandbunker.table.new.lookup[[i]]
  }
}



sum(shipandbunker.lookup == 0)
which(shipandbunker.lookup == 0)
shipandbunker.table.new$port[which(shipandbunker.lookup == 0)]
sum(shipandbunker.lookup == 9999)
which(shipandbunker.lookup == 9999)
shipandbunker.table.new$port[which(shipandbunker.lookup == 9999)]


shipandbunker.lookup[6] = 2640
shipandbunker.lookup[7] = 2680
shipandbunker.lookup[11] = 3451
shipandbunker.lookup[12] = 2168
shipandbunker.lookup[17] = 3522
shipandbunker.lookup[18] = 271
shipandbunker.lookup[19] = 1935
shipandbunker.lookup[21] = 867
shipandbunker.lookup[22] = 4364
shipandbunker.lookup[25] = 3244
shipandbunker.lookup[44] = 1192
shipandbunker.lookup[61] = 548
shipandbunker.lookup[65] = 4267
shipandbunker.lookup[81] = 1108
shipandbunker.lookup[86] = 3561
shipandbunker.lookup[96] = 909
shipandbunker.lookup[103] = 2194
shipandbunker.lookup[104] = 285
shipandbunker.lookup[110] = 3986
shipandbunker.lookup[114] = 3984
shipandbunker.lookup[119] = 1803
shipandbunker.lookup[122] = 3868
shipandbunker.lookup[127] = 4290
shipandbunker.lookup[128] = 367
shipandbunker.lookup[131] = 796
shipandbunker.lookup[134] = 1239
shipandbunker.lookup[135] = 1678
shipandbunker.lookup[136] = 1681
shipandbunker.lookup[142] = 1393
shipandbunker.lookup[143] = 2530
shipandbunker.lookup[144] = 1678
shipandbunker.lookup[146] = 4212


shipandbunker.lookup[3] = 1424
shipandbunker.lookup[13] = 3107
shipandbunker.lookup[16] = 4230
shipandbunker.lookup[20] = 672
shipandbunker.lookup[24] = 1209
shipandbunker.lookup[28] = 1863
shipandbunker.lookup[56] = 3379
shipandbunker.lookup[60] = 548
shipandbunker.lookup[69] = 1993
shipandbunker.lookup[83] = 3818
shipandbunker.lookup[155] = 3911
  
  
  
  



c1 = as.character(shipandbunker.table.new$port)
c2 = as.character(port_directory.table$port[shipandbunker.lookup])
c3 = as.character(port_directory.table$country[shipandbunker.lookup])
c4 = port_directory.table$longitude[shipandbunker.lookup]
c5 = port_directory.table$latitude[shipandbunker.lookup]
c6 = na.omit(data.frame(
  port = c1, pd.port = c2, pd.country = c3, 
  longitude = c4, latitude = c5, stringsAsFactors = FALSE))

shipandbunker.lookup = c6
save(shipandbunker.lookup, file = 'shipandbunker.lookup')









###########################################################################
