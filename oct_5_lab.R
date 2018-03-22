install.packages("tidyverse")
library(tidyverse)
getwd()

x <- c("abcd", "cdab", "cabd", "c abd", "abab")

x <- c("abcd", "cdab", "cabd", "c abd")
x[str_detect(x, "ab")]

x[str_detect(x, "^ab|")]

x[str_detect(x, "\\bab")]


state.name

library(stringr)
state.name[str_detect(state.name, "ss")]

state.name[str_detect(state.name, "^(South).(a)$")]

x <- c("Atlanta, GA", "New York, NY")
str_split(x, "[:punct:][:blank:]")

x%>%
  str_locate("[:upper:]{2}") %>%
  str_sub(x, .)

str_locate(x, "\\w+") # double backslash!!

x <- c("^ab", "ab", "abc", "abd", "abe", "ab 12")
x[str_detect(x, "ab.")]

x[str_detect(x, "ab[c-e]")]

x[str_detect(x, "\\^ab")]

