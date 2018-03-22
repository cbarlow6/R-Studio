getwd()

#read csv file
df <- read_csv(file = "HousePrices.csv")
class(df)

#show price, aircon & gasheat for houses with no garage
df %>% 
  filter(garage == 0) %>%
  select(c(price, aircon, gasheat)) 

#show how many houses with and without aircon
df %>%
  group_by(aircon) %>%
  summarise(n_house = n())

#create price_per_bedroom (price/bedrooms)
#show price, bedrooms and price_per_bedroom 
#arrange in desc order by price_per_bedroom
df %>%
  mutate(price_per_bedroom = price/bedrooms) %>%
  select(c(price,bedrooms,price_per_bedroom)) %>%
  arrange(desc(price_per_bedroom))
