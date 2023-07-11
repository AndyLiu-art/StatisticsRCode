# 加载带有惩罚项的广义线性模型
library("glmnet")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap44\\sourcecode")
# 生成数据
set.seed(1010)
n <- 500
p <- 30
# 维度截取整数
nzc <- trunc(p / 10)
x <- matrix(rnorm(n * p), n, p)
# 构造稀疏的系数
beta <- matrix(rnorm(30), 10, 3)
beta <- rbind(beta, matrix(0, p - 10, 3))
f <- x %*% beta
p <- exp(f)
# 真实的概率
p <- p / apply(p, 1, sum)
# 生成多项分布的结果y
g <- glmnet:::rmult(p)
cvfit <- cv.glmnet(x, g, family = "multinomial", type = "class")
dev.new()
pdf("../codeimage/code4.pdf")
plot(cvfit)
title("Multinomial Family", line = 2.5)
dev.off()
dev.off()
# 保存工作空间
save.image("R8.RData")
