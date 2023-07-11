# 加载带有惩罚项的广义线性模型
library("glmnet")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap44\\sourcecode")
# 生成数据
set.seed(1010)
n <- 1000
p <- 100
# 维度截取整数
nzc <- trunc(p / 10)
# 生成数据x
x <- matrix(rnorm(n * p), n, p)
# 生成真实的系数
beta <- rnorm(nzc)
# 生成真实的y
fx <- x[, seq(nzc)] %*% beta
eps <- rnorm(n) * 5
y <- drop(fx + eps)
# 构建CV的lasso回归模型
cvob1 <- cv.glmnet(x, y)
dev.new()
pdf("../codeimage/code1.pdf")
# 绘制系数路径图
plot(cvob1)
title("Gaussian Family", line = 2.5)
dev.off()
dev.off()
# 输出模型的系数
print(coef(cvob1))
# 找到mse最小的lambda对应的预测值
pred <- predict(cvob1, newx = x[1:5, ], s = "lambda.min")
print(pred)
# 保存工作空间
save.image("R5.RData")
