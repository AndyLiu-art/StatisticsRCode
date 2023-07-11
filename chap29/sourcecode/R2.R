# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap29\\sourcecode")
# logistic回归模型
res <- glm(Species ~ ., data = iris[1:100, ], family = binomial)
print(summary(res))
# 预测
prob_pred <- predict(res, type = "response")
y_pred <- ifelse(prob_pred > 0.5, 1, 0)
print("分类结果：")
print(y_pred)
# 保存工作空间
save.image("R2.RData")
