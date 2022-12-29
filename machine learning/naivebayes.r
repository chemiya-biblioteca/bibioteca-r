install.packages("e1071")
install.packages("caTools")
install.packages("caret")


library(e1071)
library(caTools)
library(caret)


split <- sample.split(iris, SplitRatio = 0.7)
train_cl <- subset(iris, split == "TRUE")
test_cl <- subset(iris, split == "FALSE")

train_cl

train_scale <- scale(train_cl[, 1:4])
train_scale
test_scale <- scale(test_cl[, 1:4])


set.seed(120)  
classifier_cl <- naiveBayes(Species ~ ., data = train_cl)
classifier_cl


y_pred <- predict(classifier_cl, newdata = test_cl)


cm <- table(test_cl$Species, y_pred)
cm


confusionMatrix(cm)