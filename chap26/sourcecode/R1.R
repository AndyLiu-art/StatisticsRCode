# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap26\\sourcecode")
dataf <- data.frame(
    x = c(2, 5, 7, 10, 14, 19, 26, 31, 38, 45, 52, 53, 60, 65),
    y = c(54, 45, 37, 37, 35, 25, 20, 16, 13, 8, 11, 8, 4, 6)
)
# 非线性回归
res <- nls(y ~ a0 * exp(-x) + a1, data = dataf, start = list(a0 = 1, a1 = 1))
print(summary(res))
# 拟合值
print(predict(res))
# 保存工作空间
save.image("R1.RData")
