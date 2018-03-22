
z = c(joe = 1, moe = 2, jack = 3)
z
y = seq(from = 1, to = 10, by = 2)
y
names(y) = c()
b = seq(from =10, to = 20, by = 1)
b
n = seq(from = -35, to = 30, by = 5)
n
fruit = c(apple = 4, banana = 5, cherry = 3)
fruit
10:20
seq(-35,30,5)
c(apple = 4, banana = 5, cherry = 3)

x = list(name = "Anna", is_female = TRUE, 
     age = 22, enrollment = c("CIS4710", "CIS4720", "CIS4730"),
     grade_point = c(4, 3,4))
x
mean(x[[5]])
mean(x$grade_point)