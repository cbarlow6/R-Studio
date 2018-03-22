state.name
library(stringr)

state.name[str_detect(state.name, "(South|North|West)")]

newstate <-(state.name[str_detect(state.name, "(V|v)")])               
newstate[str_detect(newstate, "(a$)")]

x <- c("4044132000", "520-123-2000", "844.999.4500", "10/30/2017")
phone_number_regex_str = "[:digit:]{3}[-.]?[:digit:]{3}[-.]?[:digit:]{4}"
str_detect(x, phone_number_regex_str) # see below for the right output

j <- "@GeorgiaStateU: My email is yklin@gsu.edu and lin40@gmail.com"
newtext <-(str_split(j, pattern=" "))

for(i in newtext){  
  print(str_extract_all(newtext, "[:alnum:]{5,}[@][:alpha:]{3,}[.][:alpha:]{3}"))
  #print(str(email))
}

#Detect emails from the following text using regex:
z<- "@GeorgiaStateU: My email is yklin@gsu.edu and lin40@gmail.com"
pos <- str_locate_all(z, "\\w+@\\w+\\.\\w+")[[1]]
str_sub(z, pos)


