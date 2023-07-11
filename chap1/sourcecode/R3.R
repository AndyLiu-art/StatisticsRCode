# 设置工作目录
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap1\\sourcecode")
# 加载功效检验的包
library("pwr")
# 第一类错误概率控制
alpha <- 0.05
# 第二类错误概率控制
beta <- 0.1
# 样本量
n <- 100
# 允许差异
mu <- 0.3
# 标准差
sigma <- 0.78
# 效应大小
d <- mu / sigma
res1 <- pwr::pwr.t.test(
    d = d, # 效应大小
    sig.level = alpha, # 显著性水平
    power = 1 - beta, # 检验功效
    type = "paired", # 双样本
    alternative = "two.sided" # 双边检验
)
res2 <- pwr::pwr.t.test(
    n = n, # 样本量
    d = d, # 效应大小
    sig.level = alpha, # 显著性水平
    type = "paired", # 双样本
    alternative = "two.sided" # 双边检验
)
print(res1)
print(res2)
# 保存工作空间
save.image("R3.RData")
