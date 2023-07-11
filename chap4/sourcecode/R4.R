# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap4\\sourcecode")
# 必须以dataframe形式存储
datamat <- matrix(
    c(
        1.00, 1.01, 1.13, 1.14, 1.70, 2.01, 2.23, 2.63,
        0.96, 1.23, 1.54, 1.96, 2.94, 3.68, 5.59, 6.96,
        2.07, 3.72, 4.50, 4.90, 6.00, 6.84, 8.23, 10.33
    ), # 数据
    ncol = 3, # 列数
    dimnames = list(1:8, c("A", "B", "C")) # 列名
)
res <- friedman.test(
    datamat # 数据
)
print(res)
# 保存工作空间
save.image("R4.RData")
