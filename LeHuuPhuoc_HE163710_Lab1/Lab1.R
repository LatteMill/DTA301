##########################################
# Lab 1 – Requirements
##########################################

setwd("D:/FALL2022/DTA301/Lab01Description")
getwd()

# A. Given data in the yearly_request.csv, please complete the following tasks. 

# 1.	Import data in .csv file to requests data frame in R
requests <- read.csv("yearly_request.csv")

# 2.	Export the histogram of number of requests to jpeg file
jpeg(file="D:/FALL2022/DTA301/Lab01Description/requests_hist.jpeg") # create a new jpeg file
hist(requests$no_of_requests) # export histogram to jpeg
dev.off() # shut off the graphic device

# 3.	Add a column per_request to dataset and exports the modified dataset to 
# “requests_modified.txt” file
write.table(requests,"requests_modified.txt", sep="\t", row.names=FALSE)

# 4.	Extract the second, third, and fourth column of the requests data frame
requests[, 2:4]

# 5.	build an empty character vector of the same length as requests 
requests_group <- vector(mode="character",
                      length=length(requests$req_total))

# group the customers according to the request amount
requests_group[requests$requests_total<100] <- "small"
requests_group[requests$requests_total>=100 & requests$requests_total<500] <- "medium"
requests_group[requests$requests_total>=500] <- "big"

# 6.	Summary of requests
summary(requests)

# 7.	Calculate and show total of request value
summary(requests$req_total)

# B.  Write commands 
# 1.	Create a vector v contain values from 1 to 50
v <- c(1:50)

# 2.	Calculate the total value of all elements in v
sum(v)

#  3.	List all elements which has value greater than 10 and less than 40
v[v>10&v<40]

#4.	Create a new vector from vector v.  Element value in the new vector is two times of element value in v
w <- v*2

# 5.	Write the code to generate data (with norm = 60, mean = 0, sd = 0.6) and show this data like the below figure

x <- rnorm(60)
y <- x + rnorm(60, mean=0, sd=0.6)

data <- as.data.frame(cbind(x, y))
summary(data)

library(ggplot2)
ggplot(data, aes(x=x, y=y)) +
  geom_point(size=2) +
  ggtitle("Scatterplot of X and Y") + 
  theme(axis.text=element_text(size=12), 
        axis.title = element_text(size=14),
        plot.title = element_text(size=20, face="bold"))