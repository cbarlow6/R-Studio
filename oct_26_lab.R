install.packages("patentsview")
library(patentsview)
library(tidyverse)

result = search_pv(
  query = '{"_gte":{"patent_date":"2016-01-01"}}', 
  fields = c("patent_id", "patent_date")
)
result

result$data
result$data$patents
str(result)

patent_df = result$data$patents
patent_df

result1 = search_pv(
  query = '{"_gte":{"patent_date":"2016-01-01"}}', 
  fields = c("patent_id", "patent_date")
)
?qry_funs # To see what query functions are available

result2 = search_pv(
  query = qry_funs$gte(patent_date = "2016-01-01"), 
  fields = c("patent_id", "patent_date")
)
?qry_funs # To see what query functions are available

result3 = search_pv(
  query = qry_funs$gte(patent_date = "2016-01-01"), 
  fields = c("patent_id", "patent_date")
)
?qry_funs # To see what query functions are available

result4 = search_pv(
  query = qry_funs$eq(patent_id = "8395459"), 
  fields = c("patent_id", "patent_date")
)
?qry_funs # To see what query functions are available

result1
result2
result3
result4

result5 = search_pv(
  query = qry_funs$eq(inventor_state = "GA"),
  fields = c("patent_id", "inventor_last_name", 
             "inventor_state", "assignee_organization", 
             "assignee_state")                    
)

str(result5$data$patents)

unnested_result = result5$data$patents %>% 
  unnest(inventors)

unnested_result

my_query <- qry_funs$and(
  qry_funs$gte(patent_date = "2016-01-01"),
  qry_funs$lte(patent_date = "2016-03-31"),
  qry_funs$eq(inventor_state = "CA"), 
  qry_funs$contains(assignee_organization = "microsoft"),
  qry_funs$text_any(patent_abstract = c("computer", "software"))
)
result6 = search_pv(
  query = my_query, fields = c("patent_id", "patent_date")
)
result6

unnested_result1 = result5$data$patents %>% 
  unnest(assignees, .drop=FALSE) %>%
  unnest(inventors)

unnested_result1

my_query1 <- qry_funs$and(
  qry_funs$gte(patent_date = "2016-01-01"),
  qry_funs$lte(patent_date = "2016-03-31"),
  qry_funs$eq(inventor_city = "Atlanta"),
  qry_funs$eq(assignee_city = "Atlanta"),
  qry_funs$text_any(patent_abstract = c("bitcoin",
                                        "fintech",
                                        "blockchains")), 
  qry_funs$contains(assignee_country = "Canada"),
  qry_funs$gt()
  qry_funs$text_any(patent_abstract = c("computer", "software"))
)
result6 = search_pv(
  query = my_query1, 
  fields = c("patent_id", "inventor_last_name")
)
result6

View(patent_df) 

my_query3 <- qry_funs$and(
  qry_funs$gte(patent_date = "2016-01-01"),
  qry_funs$lte(patent_date = "2016-03-31"),
  qry_funs$contains(assignee_country = "CA"),
  qry_funs$gt(assignee_total_num_inventors = 10)
)
result7 = search_pv(
  query = my_query3, 
  fields = c("patent_id", "inventor_last_name",
             "inventor_city", "assignee_country",
             "assignee_total_num_inventors")
)
result7
View(unnested_result7)

my_query3 <- qry_funs$and(
  qry_funs$gte(patent_date = "2016-01-01"),
  qry_funs$lte(patent_date = "2016-03-31"),
  qry_funs$eq(assignee_country = "CA"),
  qry_funs$gt(patent_num_cited_by_us_patents = 10)
)
result7 = search_pv(
  query = my_query3, 
  fields = c("patent_id", "inventor_last_name",
             "inventor_city", "assignee_country",
             "assignee_total_num_inventors")
)
