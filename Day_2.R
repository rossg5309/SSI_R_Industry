#Day 2 script notes
x <- 1
is.numeric(x) # this is true if x is double or integer
is.integer(x) # x defaults to double
is.double(x)

x <- 1L # capital L at end tells R you want this as an integer
is.numeric(x)
is.integer(x)
is.double(x)

x <- c(1L, 1L, 1L)
is.integer(x)
x[2] <- 2 #adding a 2 will make this double again
is.integer(x)
x[2] <- 2L #this wont work since all elements are now stored double
is.integer(x)


x <- factor(c('a','a','b','c','d'))
as.numeric(x) #value representing the level
as.character(x)
x[1] <- 'z' #cant add/modify a value not in levels
levels(x)
levels(x)[5]<-'z'
x[1] <- 'z'
levels(x)[6] <-'q'
table(x) #includes a zero count for q
table(c('z','a','b','c','d')) #wont have q

x <- factor(c(4,3,3,0,-1)) #CAREFUL MAKING FACTORS NUMBERS
as.numeric(x) #WATCH OUT HERE
as.numeric(as.character(x))

x <- list(
  "order_id" = "49F68D857C29297E5FBEA1EEA4AEE",
  "customer_id" = "95F61616BE2CECEA36851E6BEC51F",
  "credit_card_on_file" = F,
  "item_categories" = c('cat_A','cat_B','cat_C'),
  "history" = list(
    list(page="home_site",duration=3248),
    list(page="category_A_site", duration=15338),
    list(page="shopping cart", duration=54),
    list(page="order history",duration=985),
    list(page="shopping cart", duration=53),
    list(page="confirm order", duration=6842)
  )
)

#different ways to extract list components
x[[1]] #index number
x$order_id #component name
x[['order_id']] #same as above
y <- 'order_id'
x[[y]]
#can keep list structure
x[1]
x['order_id']
class(x[['order_id']])
class(x['order_id'])

#keep track when extracted a substructure
x[['history']]
length(x[['history']])
x['history']
length(x['history'])

x[1:3]
x[[1:3]] #cant do this
x[c('order_id','item_categories')]

x <- data.frame('categories'=sample(letters,10, replace=T), 'values'=rnorm(10))
x

y <- list(
  "set1" = data.frame('categories'=sample(letters,10, replace=T), 'values'=rnorm(10)),
  "set2" = data.frame('categories'=sample(letters,5, replace=T), 'values'=rnorm(5))
)

#extracting subset
x$categories
x[,c('categories')]
x[[1]]
x[,c(1,2)]
x[,-1]
x[,c(T,F)]
x[1,2]
x[1:4,2]
x[1:4,2,drop = F] #if you want to keep the data.frame structure
subset(x,categories == 'c',c(values,categories))

x <- data.frame('categories'=sample(letters,10, replace=T), 'values'=rnorm(10), stringsAsFactors = F)
x$categories #now a character vector instead of factor
y <- data.frame('categories'=sample(letters,10, replace=T), 'values'=rnorm(10), stringsAsFactors = F)
z <- rbind(x,y)
x
y
z
names(y)<-c('type','weight')
y
rbind(x,y)
z <- cbind(x,y)
z
x1 <- x[1:7,]
x1
cbind(x1,y)
x1 <- x[1:5,]
x1
cbind(x1,y) #x1 is recycled

library(jsonlite)
x <- fromJSON('example_json_3.json')
x

x[,"bio"][1]

library(httr)
# https://maps.googleapis.com/maps/api/distancematrix/json?origins=Vancouver+BC|Seattle&destinations=San+Francisco|Victoria+BC&key=YOUR_API_KEY
resp<-GET("https://maps.googleapis.com/maps/api/distancematrix/json",query = list("origins"="Vancouver+BC|Seattle","destinations"="San+Francisco|Victoria+BC","key"="AIzaSyAv1fkBQeAWbbtf5PheRRkvnYI3HE8KKtY"))
results <- content(resp)
results
