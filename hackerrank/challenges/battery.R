# Enter your code here. Read input from STDIN. Print output to STDOUT

data.train <- read.csv("trainingdata.txt", header=F, sep=",")

model <- lm(V2 ~ V1, data=data.train, subset=data.train$V1<4)

f <- file("stdin")
open(f)
input <- as.numeric(readLines(f, n=1))
close(f)

plot(data.train$V2, data.train$V1)

data.test <- data.frame(V1=c(as.numeric(input)))
prediction <- min(c(predict(model, data.test)[1], 8))
cat(round(prediction, 2), "\n")
