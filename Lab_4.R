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
str(historical_data_table)
class(historical_data_table)


df3 = historical_data_table[[1]]

#View(df3)
rownames(df3) # get row names

colnames(df3)
df3[1,]

newtable <-df3[(2:19), ]

colnames(newtable) <- c( "Census","Pop.", "c3", "%±")
colnames(newtable)

rownames(newtable)
rownames(newtable) <- c("1", "2", "3", "4", "5", "6",
                        "7", "8", "9","10", "11", "12",
                        "13", "14", "15", "16", "17", "18")
newtable[ ,c("Census", "Pop.", "%±")]


