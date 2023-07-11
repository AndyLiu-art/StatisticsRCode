# 加载带有惩罚项的广义线性模型
library("glmnet")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap44\\sourcecode")
set.seed(100)
# 生成数据及
x <- matrix(rnorm(100 * 20), 100, 20)
y <- rnorm(100)
fit1 <- bigGlm(x, y)
print(fit1)
# 查看系数
print(coef(fit1))
fit2 <- lm(y ~ x, data = data.frame(x = x, y = y))
print(fit2)
# 保存工作空间
save.image("R2.RData")
