install.packages("tidyverse")
library(tidyverse)
getwd()

library(stringr)

x = c("Georgia", "State", "University")
str_length(x)

x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 3)

str_c("Georgia", "State", "University")

str_c("Georgia", "State", "University", sep=" ")

s="Catresa"
str_length(s)

str_sub(s,
        round(str_length(s)/2),
        round(str_length(s)/2))

str_sub(s,
        floor(str_length(s)/2+1),
        floor(str_length(s)/2)+1)

vec = c("Georgia", "State", "University")
str_to_upper(vec)

str_to_lower(vec)

str_sub(vec, 3, 3) <- str_to_upper(str_sub(vec, 3, 3))
vec

x <- c("Apple", "Banana", "Pear")
str_split(x, pattern="a")

x <- c("apple", "eggplant", "banana")
str_sort(x)

cities <- c("Atlanta, GA", "New York, NY", "Los Angeles, CA")

str_to_upper(cities)

y = str_split(cities, pattern=", ")
str(y)

y[[1]][1]
y[[1]][2]

for(i in 1:3)
  print(str_c("City: ", y[[i]][1]))

x = "He said: \"It's raining outside.\""
str_detect(x, "\"")

print("a\nb")
cat("a\nb")

state.name
library(stringr)

str_detect(state.name, " ")
state.name[str_detect(state.name, " ")]

state.name[str_detect(state.name, "ss")]

state.name

x <- c("abcd", "cdab", "cabd", "c abd", "abab")

x <- c("abcd", "cdab", "cabd", "c abd")
x[str_detect(x, "ab")]

x[str_detect(x, "^ab|")]

x[str_detect(x, "\\bab")]

