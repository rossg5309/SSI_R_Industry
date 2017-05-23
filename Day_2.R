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
