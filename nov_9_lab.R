install.packages("mongolite")
library(mongolite)

username = "cbarlow6"
password = "uprising"
database = "db1"
url = "cluster0-shard-00-00-r9e3w.mongodb.net"

connection_url = paste(
  "mongodb://",username,":",password,"@",url,":27017/",database,
  "?ssl=true&replicaSet=Cluster0-shard-0&authSource=admin", sep="")
connection_url

m <- mongo(url = connection_url, collection = "c1")
m$find()