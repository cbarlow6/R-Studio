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
           #      header=TRUE, stringsAsFactors=FALSE)

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
