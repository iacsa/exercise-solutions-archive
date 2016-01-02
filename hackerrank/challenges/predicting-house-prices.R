f <- file("stdin")
open(f)

readrow = function() {
  line <- readLines(f, n=1)
  return(as.numeric(unlist(strsplit(line, " "))))
}

params <- readrow()
features <- params[1]
samples.train <- params[2]

data.train = as.data.frame(matrix(nrow=samples.train, ncol=features + 1))
colnames(data.train)[features + 1] <- "price"

for (n in 1 : samples.train) { data.train[n,] = readrow() }

params <- readrow()
samples.test <- params[1]

data.test = as.data.frame(matrix(nrow=samples.test, ncol=features))

for (n in 1 : samples.test) { data.test[n,] = readrow() }

close(f)

model <- lm(price ~ .^2, data.train)
predictions <- predict(model, data.test)

for (n in 1 : samples.test) {
  cat(round(predictions[n], 3), "\n")
}
