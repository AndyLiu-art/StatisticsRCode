# 加载Z检验的包
library("BSDA")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 待检验的数据
salt <- c(490, 506, 508, 502, 498, 511, 510, 515, 512)
res1 <- t.test(
    salt, # 样本
    mu = 500, # 待检验的总体均值
    alternative = "two.sided", # 双边检验
    conf.level = 0.95 # 置信水平
)
res2 <- BSDA::z.test(
    x = salt, # 样本
    mu = 500, # 待检验的总体均值
    sigma.x = sqrt(10), # 样本的标准差
    alternative = "two.sided", # 双边检验
    conf.level = 0.95 # 置信水平
)
print(res1)
print(res2)
# 保存工作空间
save.image("R1.RData")
