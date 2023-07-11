# 加载带有惩罚项的广义线性模型
library("glmnet")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap44\\sourcecode")
# 生成数据
set.seed(1010)
# 生成数据
N <- 500
p <- 20
nzc <- 5
x <- matrix(rnorm(N * p), N, p)
# 真实参数
beta <- rnorm(nzc)
# 真实的y
f <- x[, seq(nzc)] %*% beta
mu <- exp(f)
y <- rpois(N, mu)
# 拟合lasso下的泊松回归
fit <- glmnet(x, y, family = "poisson")
# 预测y
pfit <- predict(fit, x, s = 0.001, type = "response")
print(pfit)
dev.new()
pdf("../codeimage/code7.pdf")
par(mfrow = c(2, 1))
plot(fit)
title("Poisson Family", line = 2.5)
plot(pfit, y)
title("predict vs true", line = 2.5)
dev.off()
dev.off()
# 保存工作空间
save.image("R11.RData")
