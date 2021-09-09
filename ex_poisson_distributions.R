#make example poisson distributions
#https://www.theanalysisfactor.com/differences-between-normal-and-poisson-distributions/

library(ggplot2)
library(plyr)

#Using tidyverse

#generate fake poisson distributions using 1000 replicate draws with differing means
set.seed(1234) #so everybodys 'random draws' look the same
data <- data.frame(cond = factor(rep(c("A","B","C","D"), each=1000)), 
                   rating = c(rpois(1000, 0.8),rpois(1000, 1.5),
                              rpois(1000, 5.0), rpois(1000, 12.0)))

#find the mean of each group
means <- ddply(data, "cond", summarise, rating.mean=mean(rating))
means

# Plot histograms with mean lines, using means from above
ggplot(data, aes(x=rating)) + geom_histogram(binwidth=1, colour="black", fill="white") + 
  facet_grid(cond ~ .) +
  scale_x_continuous(breaks=seq(0,30,5)) +
  geom_vline(data=means, aes(xintercept=rating.mean), linetype="dashed", size=1, colour="red")





#Using base R

#generate fake poisson distributions
#1000 replicate draws with differing means
a<-rpois(1000, 0.8)
b<-rpois(1000, 1.5)
c<-rpois(1000, 5.0)
d<-rpois(1000, 12.0)

par(mfrow=c(4,1))
hist(a)
hist(b)
hist(c)
hist(d)

