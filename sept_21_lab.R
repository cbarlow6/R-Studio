install.packages("tidyverse")
library(tidyverse)
getwd()

setwd("/Users/catresa/CIS4730")

getwd()
list.files()

df <- read_csv(file = "HousePrices.csv")
class(df)


head(df, n=2)

hist(df$lotsize, col="red", xlim=c(0, 10000),
     xlab="Lot size of house", ylab="Frequency", 
     main="Distribution of house lot size")

distribution <- table(df$bedrooms)
distribution

barplot(distribution)

distribution <- table(df$recreation)
pie(distribution)

plot(bedrooms ~ price, data=df, 
     pch=ifelse(df$fullbase=="yes", 3, 5), # pch: symbols for the points
     col=ifelse(df$fullbase=="yes", "brown", "orange")) # col: colors of the points
legend("topright", c("w/ fullbase", "w/t fullbase"), 
       pch=c(3, 5), col=c("brown", "orange"))





for(grade in c("A", "A", "C", "B", "B")) { 
  if(grade == "A") {
    print(4)
  
  } else if (grade == "B") {
    print(3)
    
  } else if (grade == "C") {
    print(2)
    
  } else if (grade == "D") {
    print(1)
  
  }else { 
    print(0)
  }
} 
sum = 0
for(i in 1:100){
  sum = sum + i
}
print(sum)

total = 0
i = 1
while(i <= 100){
  total = total + i
  i = i + 1
}
print(total)

times_num <- function(num1, num2) {
  value = num1 * num2  # be sure to match the input variable name 
  return(value)  # return() says what the output is
}
a = times_num(15, 4)
print(a)