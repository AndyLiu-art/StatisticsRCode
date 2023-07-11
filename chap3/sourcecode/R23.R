# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 样本
data <- c(420, 500, 920, 1380, 1510, 1650, 1760, 2100, 2300, 2350)
res <- ks.test(
    x = data, # 样本
    y = "pexp", # 指数分布
    rate = 1 / 1500 # 指数分布的参数
)
print(res)
# 保存工作空间
save.image("R23.RData")
