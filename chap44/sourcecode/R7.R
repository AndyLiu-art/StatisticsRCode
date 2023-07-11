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
# 生成真实概率
px <- exp(fx)
px <- px / (1 + px)
# 生成二项结果变量
ly <- rbinom(n = length(px), prob = px, size = 1)
# 构建CV的lasso的logistic模型
cvob1 <- cv.glmnet(x, ly, family = "binomial")
cvob2 <- cv.glmnet(x, ly, family = "binomial", type.measure = "class")
dev.new()
pdf("../codeimage/code3.pdf")
par(mfrow = c(1, 2))
plot(cvob1)
title("Binomial Family(deviance)", line = 2.5)
plot(cvob2)
title("Binomial Family(class)", line = 2.5)
dev.off()
dev.off()
# 保存工作空间
save.image("R7.RData")
