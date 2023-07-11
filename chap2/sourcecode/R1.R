# 加载z检验的包
library("BSDA")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap2\\sourcecode")
# 待估计的数据
x <- c(
    2.14, 2.10, 2.13, 2.15, 2.13, 2.12, 2.13, 2.10,
    2.15, 2.12, 2.14, 2.10, 2.13, 2.11, 2.14, 2.11
)
res <- BSDA::z.test(
    x = x, # 样本
    alternative = "two.sided", # 双边检验
    sigma.x = 0.02, # 总体标准差
    conf.level = 0.95 # 置信水平
)
print(res)
# 保存工作空间
save.image("R1.RData")
