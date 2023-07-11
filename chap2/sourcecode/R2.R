# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap2\\sourcecode")
# 待估计的数据
x <- c(
    12.15, 12.12, 12.01, 12.08, 12.09, 12.16, 12.03, 12.01,
    12.06, 12.13, 12.07, 12.11, 12.08, 12.01, 12.03, 12.06
)
res <- t.test(
    x = x, # 样本
    alternative = "two.sided", # 双边检验
    conf.level = 0.95 # 置信水平
)
print(res)
# 保存工作空间
save.image("R2.RData")
