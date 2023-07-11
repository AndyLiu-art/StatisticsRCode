# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 样本
dataf <- c(
    4632, 4728, 5052, 5064, 5484, 6972, 7696,
    9048, 14760, 15013, 18730, 21240, 22836, 52788, 67200
)
# 待检验的中位数
me <- 6064
res <- wilcox.test(
    x = dataf, # 样本
    mu = me, # 待检验的中位数
    alternative = "two.sided", # 双边检验
    conf.int = TRUE # 输出置信区间
)
print(res)
# 保存工作空间
save.image("R9.RData")
