data <- ISLR::Default
summary(data)
View(data)

set.seed(1)

sample <- sample(c(TRUE, FALSE), nrow(data), replace=TRUE, prob=c(0.7,0.3))
train <- data[sample, ]
test <- data[!sample, ]

model <- glm(default~student+balance+income, family="binomial", data=train)

options(scipen=999)

summary(model)

pscl::pR2(model)["McFadden"]

new <- data.frame(balance = 1400, income = 2000, student = c("Yes", "No"))
predict(model, new, type="response")
predicted <- predict(model, test, type="response")

# Load the necessary package
library(ROCR)

# Convert defaults from "Yes" and "No" to 1's and 0's
test$default <- ifelse(test$default == "Yes", 1, 0)

# Create a prediction object
pred <- prediction(predicted, test$default)

# Create a performance object for accuracy
perf <- performance(pred, "acc")

# Find the optimal cutoff (where accuracy is maximized)
optimal_index <- which.max(slot(perf, "y.values")[[1]])
optimal_cutoff <- slot(perf, "x.values")[[1]][optimal_index]

# Display the optimal cutoff
optimal_cutoff
confusionMatrix(test$default, predicted)
install.packages("caret")

# Load the necessary package
library(caret)

# Convert defaults from "Yes" and "No" to 1's and 0's
test$default <- ifelse(test$default == "Yes", 1, 0)

# Define a threshold for predicted probabilities to classify as positive
threshold <- 0.5  # You can adjust this based on your needs

# Convert predicted probabilities to binary outcomes
predicted_class <- ifelse(predicted >= threshold, 1, 0)

# Create a confusion matrix
conf_matrix <- confusionMatrix(as.factor(predicted_class), as.factor(test$default))

# Calculate sensitivity
sensitivity <- conf_matrix$byClass["Sensitivity"]

# Calculate specificity
specificity <- conf_matrix$byClass["Specificity"]

# Display the results
sensitivity
specificity
