# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
# 样本
x1 <- c(1500, 1500, 3300, 4200, 2000, 2500, 2300, 2500)
x2 <- c(5000, 4000, 3000, 2500, 2000, 2500, 3500, 3000)
y <- c(96000, 95000, 95000, 94000, 90000, 92000, 95000, 94000)
# 合并为数据框
dataf <- data.frame(x1, x2, y)
lmod <- lm(y ~ x1 + x2, data = dataf)
# 回归结果
print(summary(lmod))
# Cook距离
res <- cooks.distance(lmod)
print(res)
# 保存工作空间
save.image("R17.RData")
