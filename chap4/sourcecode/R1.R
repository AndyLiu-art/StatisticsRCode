# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap4\\sourcecode")
# 必须以dataframe形式存储
dataf <- data.frame(
    x = c(
        1600, 1610, 1650, 1680, 1700, 1700, 1780, 1500, 1640,
        1400, 1700, 1750, 1640, 1550, 1600, 1620, 1640, 1600,
        1740, 1800, 1510, 1520, 1530, 1570, 1640, 1600
    ),
    category = factor(
        c(rep(1, 7), rep(2, 5), rep(3, 8), rep(4, 6))
    ) # 数值型离散变量必须转为因子
)
res <- aov(x ~ category, data = dataf)
print(res)
print(summary(res))
# 保存工作空间
save.image("R1.RData")
