# quick analysis of the idp mali data
library(reshape2)
library(ggplot2)

data <- read.csv('data/output_2.csv')
x <- melt(data)

# cleaning
x$variable <- sub("X", "", x$variable)
x$variable <- sub("\\.", "-", x$variable)
x$variable <- sub("\\.", "-", x$variable)
x$variable <- as.Date(x$variable)
names(x) <- c('name', 'date', 'value')

# casting
y <- dcast(x, date ~ name)

####################################
####################################
######### Storing for C3 ###########
####################################
####################################
write.csv(y, 'http/idp_data.csv', row.names = F)


####################################
####################################
######### Plotting Things ##########
####################################
####################################

ggplot(x) + theme_bw() +
  geom_line(aes(variable, value, color = Name), size = 1.3)
