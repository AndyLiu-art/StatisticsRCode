# 设置工作目录
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap1\\sourcecode")
# 加载功效检验的包
library("pwr")
# 第一类错误概率控制
alpha <- 0.05
# 第二类错误概率控制
beta <- 0.1
# 样本量
n <- 150
# 样本1
samplep1 <- 0.45
# 样本p
samplep2 <- 0.25
res1 <- pwr.2p.test(
    h = pwr::ES.h(samplep1, samplep2), # 效应
    sig.level = alpha, # 显著性水平
    power = 1 - beta, # 检验功效
    alternative = "two.sided" # 双边检验
)
res2 <- pwr.2p.test(
    h = pwr::ES.h(samplep1, samplep2), # 效应
    sig.level = alpha, # 显著性水平
    n = n, # 样本量
    alternative = "two.sided" # 双边检验
)
print(res1)
print(res2)
# 保存工作空间
save.image("R8.RData")
