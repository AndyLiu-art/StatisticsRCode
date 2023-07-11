# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap4\\sourcecode")
# 以dataframe形式存储
dataf <- data.frame(
    x = c(
        0.31, 0.45, 0.46, 0.43, 0.82, 1.10, 0.88, 0.72, 0.43, 0.45,
        0.63, 0.76, 0.45, 0.71, 0.66, 0.62, 0.38, 0.29, 0.40, 0.23,
        0.92, 0.61, 0.49, 1.24, 0.44, 0.35, 0.31, 0.40, 0.56, 1.02,
        0.71, 0.38, 0.22, 0.21, 0.18, 0.23, 0.30, 0.37, 0.38, 0.29,
        0.23, 0.25, 0.24, 0.22, 0.30, 0.36, 0.31, 0.33
    ),
    C1 = gl(3, 16, 48, labels = c("I", "II", "III")),
    C2 = gl(4, 4, 48, labels = c("A", "B", "C", "D"))
)
res <- aov(
    x ~ C1 + C2 + C1:C2, # 公式
    data = dataf
)
print(res)
print(summary(res))
# 保存工作空间
save.image("R8.RData")
