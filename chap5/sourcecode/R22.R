# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
# 样本
x1 <- c(7, 1, 11, 11, 7, 11, 3, 1, 2, 21, 1, 11, 10)
x2 <- c(26, 29, 56, 31, 52, 55, 71, 31, 54, 47, 40, 66, 68)
x3 <- c(6, 15, 8, 8, 6, 9, 17, 22, 18, 4, 23, 9, 8)
x4 <- c(60, 52, 20, 57, 33, 22, 6, 44, 22, 18, 34, 12, 12)
y <- c(
    78.5, 74.3, 104.3, 87.6, 95.9, 109.2, 102.7,
    72.5, 93.1, 115.9, 83.8, 113.3, 109.4
)
dataf <- data.frame(x1, x2, x3, x4)
lmod <- lm(y ~ x1 + x2 + x3 + x4, data = dataf)
print(summary(lmod))
# 计算条件数
res <- kappa(lmod)
print(res)
# 保存工作空间
save.image("R22.RData")
