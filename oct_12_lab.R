install.packages("httr")
library(httr)
characters_583 <- GET("https://anapioficeandfire.com/api/characters/583")
characters_583_content = content(characters_583)
class(characters_583_content)

data <-GET("https://api.github.com/repos/tidyverse/dplyr")
data
dat = content(data)
class(dat)

dat$watchers_count
dat$subscribers_count
dat$open_issues_count
dat$language

install.packages("rvest")
library(rvest)

lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")
lego_movie

poster_img_source <- lego_movie %>%
  html_nodes(css="#title-overview-widget img") %>%
  html_attr("src")
poster_img_source

cast_table <- lego_movie %>%
  html_nodes(xpath="//table[@class=\"cast_list\"]") %>%
  html_table()
str(cast_table) # this is a list in which data.frame is the only one element
class(cast_table)


df = cast_table[[1]]

View(df)

colnames(df) <- c("c1", "c2", "c3", "c4")
df2 = df[, c("c2", "c4")]
View(df2)

city <-GET("https://en.wikipedia.org/wiki/Atlanta")
city
newcity = content(city)
class(newcity)

atl <- read_html("https://en.wikipedia.org/wiki/Atlanta")
atl
#Get the Mayor's name
mayor_source <- atl %>%
  html_nodes(css= ".mergedrow:nth-child(18) td a:nth-child(1)") %>%
  html_text("src")
mayor_source

#Get the image source (URL) for the Atlanta City Hall
city_hall_source <- atl %>%
  html_nodes(css=":nth-child(115) .thumbimage") %>%
  html_attr("src")
city_hall_source

#Get the paragraph for the 1996 Summer Olympic Games
summer_games_source <- atl %>%
  html_nodes(css="p:nth-child(31)") %>%
  html_text("src")
summer_games_source

#Get the URLs of all the external links
external_links_source <- atl %>%
  html_nodes(css="ul:nth-child(160) .text") %>%
  html_attr("href")
external_links_source

#Get the table "Historical population", store it as a data.frame, 
#and clean the data.frame so that it looks like the data.frame in 
#the next slide
historical_data_table <- atl %>%
  html_nodes(xpath="//table[@class=\"toccolours\"]") %>%
  html_table()
str(historical_data_table) # this is a list in which data.frame is the only one element
class(historical_data_table)


df3 = historical_data_table[[1]]

View(df3)
rownames(df3) # get row names

colnames(df3)
df3[1,]

pop <- df3 # create a copy of df
colnames(pop) <- df3[1,] # assign column names
colnames(pop)   

View(pop)
pop[(2:19), ]
pop[-c(1,20), ]
pop[1, ] <- NULL

newtable <-pop[(2:19), ]

colnames(newtable) <- c( "Census","Pop.", "c3", "%±")
colnames(newtable)

rownames(newtable)
rownames(newtable) <- c("1", "2", "3", "4", "5", "6",
                        "7", "8", "9","10", "11", "12",
                        "13", "14", "15", "16", "17", "18")
newtable[ ,c("Census", "Pop.", "%±")]


  