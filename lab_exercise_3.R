state.name
library(stringr)

state.name[str_detect(state.name, "(South|North|West)")]

state.name[str_detect(state.name, coll("v", TRUE))]

state.name[str_detect(state.name, "(V|v[...]a$)")]

state.name[str_detect(state.name, "(V[a$]|v[a$])")]

state.name[str_detect(state.name, "(V|v)")]


state.name[str_detect(state.name, "(V[a$]|v[a$])")]

  
x <- c("4044132000", "520-123-2000", "844.999.4500", "10/30/2017")
phone_number_regex_str = "[:digit:]{3}[-.]?[:digit:]{3}[-.]?[:digit:]{4}"
str_detect(x, phone_number_regex_str) # see below for the right output


for(email in c("@GeorgiaStateU:", 
               "My email is", 
               "yklin@gsu.edu", 
               "and", 
               "lin40@gmail.com"))  
  str_locate_all(email, "[:alnum:]{5}[@][:alnum:]{4}[.]")
  print(email)
