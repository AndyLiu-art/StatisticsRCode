# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap4\\sourcecode")
# 必须以dataframe形式存储
dataf <- data.frame(
    x = c(
        2, 4, 3, 2, 4, 7, 7, 2, 2, 5, 4, 5,
        6, 8, 5, 10, 7, 12, 12, 6, 6, 7, 11,
        6, 6, 7, 9, 5, 5, 10, 6, 3, 10
    ),
    category = factor(
        c(rep(1, 11), rep(2, 10), rep(3, 12))
    ) # 数值型离散变量必须转为因子
)
res1 <- aov(x ~ category, data = dataf)
print(res1)
print(summary(res1))
res2 <- pairwise.t.test(
    dataf$x, # 数值变量
    dataf$category, # 分类变量
    p.adjust.method = "bonferroni", # P值调整方法
    alternative = "two.sided" # 双边检验
)
print(res2)
# 保存工作空间
save.image("R2.RData")
