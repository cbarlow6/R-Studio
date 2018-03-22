# show current working directory
getwd()
list.files()

# set working directory to text files location
setwd("/Users/catresa/CIS4730")

# show current working directory
getwd()
list.files()

# specify path to text file
#df <- read.table(file="/Users/catresa/CIS4730/HousePrices.csv", sep=",", 
 #                header=TRUE, stringsAsFactors=FALSE)

class(df) # R will convert the file to a data frame

head(df, n=5) # n indicates how many rows you'd like to see


df_semicolon <- read.table(file="HousePrices_semicolon.txt", sep=";", 
                           header=TRUE, stringsAsFactors=FALSE)
head(df_semicolon)


df_tab <- read.table(file="HousePrices_tab.txt", sep="\t", 
                     header=TRUE, stringsAsFactors=FALSE)
head(df_tab)


df_na <- read.table(file="HousePrices_with_missing_values.csv", sep=",", 
                    header=TRUE, stringsAsFactors=FALSE, 
                    na.strings = c("","NA", "Not Available"))
head(df_na)

df_na

install.packages("readxl") # R will then go online and donwload the libray 
install.packages("tidyverse")
library(tidyverse)

getwd()

df_original <- read.csv(file="HousePrices.csv", 
                        header=TRUE, stringsAsFactors=FALSE)
class(df_original) # this is a data frame
list.files()
setwd("/Users/catresa/CIS4730")
list.files()

df_original <- read.csv(file="HousePrices.csv", 
                        header=TRUE, stringsAsFactors=FALSE)
class(df_original) # this is a data frame

df <- read_csv(file="HousePrices.csv")
class(df) # this is a tibble (tbl_df)

df_original
df

select(df, c(price, lotsize)) # equivalent to df[, c("price", "lotsize")]

df %>% select(., c(price, lotsize)) # notice that df is outside

df %>% select(c(stories, driveway))

df %>% select(-c(price, lotsize, bedrooms, bathrooms)) # hide columns price, lotsize, 
                                                      # bedrooms, bathrooms

df %>% 
  select(c(stories, driveway)) %>% 
  filter(driveway == "no")

df %>%
  filter(aircon == "yes") %>%
  arrange(desc(lotsize))

df %>%
  mutate(expensive_house = ifelse(price > 150000, "yes", "no")) %>%
  select( price, expensive_house)

df %>%
  group_by(driveway) %>%
  summarise(n_house = n(), 
            min_lot_size = min(lotsize), 
            max_lot_size = max(lotsize))
