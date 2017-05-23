x <- as.Date("2017-04-01")
as.numeric(x)
as.Date(16892, origin = "1970-01-01")
x+20
class(x)
x-31
as.Date(16892, origin = "1970-01-01")

weekdays(x)
quarters(x)
months(x)

format(x, "%Y-%m-%d")
format(x, "%F")
format(x, "%m/%d/%y")

x = as.POSIXct("2016-04-01")
x = as.POSIXct("2016-04-01", "UTC")

format(x, "%F", "%T", usetz = T, tz = "US/Pacific")
