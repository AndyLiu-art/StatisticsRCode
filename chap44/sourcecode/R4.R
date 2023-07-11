# 加载带有惩罚项的广义线性模型
library("glmnet")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap44\\sourcecode")
# 生成数据
x <- matrix(rnorm(100 * 20), 100, 20)
y <- rnorm(100)
# 生成二项或者多项分布的y
g2 <- sample(1:2, 100, replace = TRUE)
g4 <- sample(1:4, 100, replace = TRUE)
# Lasso线性模型
fit1 <- glmnet(x, y)
# 预测，在lambda的0.01，0.005处
res1 <- predict(fit1, newx = x[1:5, ], s = c(0.01, 0.005))
print("在特定x处的预测值为")
print(res1)
# 各个lambda处的系数
coef1 <- predict(fit1, type = "coef")
print("所有lambda下的系数")
print(coef1)
# lasso下的logistic回归模型
fit2 <- glmnet(x, g2, family = "binomial")
# 预测，y值
res2 <- predict(fit2, type = "response", newx = x[2:5, ])
print("在特定的x处模型估计的概率值为")
print(res2)
# 非零的系数
coef2 <- predict(fit2, type = "nonzero")
print("模型估计中非零系数对应第几个变量？")
print(coef2)
# lasso下的多元logistic回归模型
fit3 <- glmnet(x, g4, family = "multinomial")
res3 <- predict(fit3, newx = x[1:3, ], type = "response", s = 0.01)
print("在特定的x处模型估计的概率值")
print(res3)
# 保存工作空间
save.image("R4.RData")
