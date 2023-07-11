# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap4\\sourcecode")
# 以dataframe形式存储
dataf <- data.frame(
    x = c(
        0.05, 0.46, 0.12, 0.16, 0.84, 1.30, 0.08, 0.38, 0.4,
        0.10, 0.92, 1.57, 0.11, 0.43, 0.05, 0.10, 0.94, 1.10,
        0.11, 0.44, 0.08, 0.03, 0.93, 1.15
    ), # 数据
    A = gl(4, 6), # 生成因子
    B = gl(6, 1, 24) # 生成因子
)
res <- aov(
    x ~ A + B, # 公式
    data = dataf
)
print(res)
print(summary(res))
# 保存工作空间
save.image("R7.RData")
