#COMPULSORY TASK
install.packages("ggplot2")
library(ggplot2)
data(package = "ggplot2")
ggplot2::diamonds
#This plot was used to evaluate the different cut of each diamond by their clarity
qplot(data = diamonds, y = clarity, geom = "bar", fill = cut)
#This plot shows the distribution between the carat of the diamond the price
qplot(data = diamonds, x = carat, y = price, geom = "boxplot", color = color)
#Using this plot, we can establish the range in depth for the cut with the premium cut having a narrow range for depth
qplot(data = diamonds, x = cut, y = depth, geom = "point")


# Additional Learning Tasks - TASK 1
a<-c(1,2,3,4,5)
b<-c(6,7,8,9,10)
c<-c(11,12,13,14,15)
matrix<-cbind(a,b,c)
print(matrix)
matplot(matrix, type="b", pch=15, col=1:3)


  # Additional Learning Tasks - TASK 2
Employees = data.frame(Name=c("John","Adam","Laura", "Holly","Carl"),
                       Age=c(30,25,29,43,38),
                       Role=c("Manager","Assistant","Analyst","Marketing","Director"),
                       ServiceLength=c("5 Years","2 Years","4 Years","20 Years","15 Years")
)
print(Employees)


# Additional Learning Tasks - TASK 3
library(ggplot2)
x = seq(1,20)
y = x^2
qplot(x,y, geom="point")


# Additional Learning Tasks - TASK 4
library(ggplot2)
Subject <- c("Mathematics","English","Chemistry","Physics","Biology")
Number_of_Students <- c(34,45,65,62,17)
frame <- data.frame (Subject, Number_of_Students)
print(frame)
ggplot(data=frame, aes(x=Subject, y=Number_of_Students)) + geom_bar(stat="identity", fill="blue")


# Additional Learning Tasks - TASK 5
name = readline(prompt="Input your name: ")
age =  readline(prompt="Input your age: ")
print(paste("Your name is",name, "and you are",age ,"years old."))


# Additional Learning Tasks - TASK 6
print("Sequence of numbers from 20 to 50:")
print(seq(20,50))
print("Mean of numbers from 20 to 50:")
print(mean(20:50))
print("Sum:")
print(sum(20:50))


# Additional Learning Tasks - TASK 7
vector = sample(-50:50, 10, replace=TRUE)
print("10 random integer values between -50 and +50:")
print(vector)


# Optional Challenge - TASK 1
Fibonacci <- numeric(10)
Fibonacci[1] <- Fibonacci[2] <- 1
for (i in 3:10) Fibonacci[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]
print("First 10 Fibonacci numbers:")
print(Fibonacci)


# Optional Challenge - TASK 2
for (i in 1:100) {
  if (i %% 3 == 0 & i %% 5 == 0) {print("FizzBuzz")}
  else if (i %% 3 == 0) {print("Fizz")}
  else if (i %% 5 == 0) {print("Buzz")}
  else print(i)
}