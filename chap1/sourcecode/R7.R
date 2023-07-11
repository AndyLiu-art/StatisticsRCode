# 设置工作目录
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap1\\sourcecode")
# 加载功效检验的包
library("pwr")
# 第一类错误概率控制
alpha <- 0.05
# 第二类错误概率控制
beta <- 0.1
# 样本量
n <- 5000
# 总体p
totalp <- 0.1
# 样本p
samplep <- 0.12
res1 <- pwr.p.test(
    h = pwr::ES.h(totalp, samplep), # 效应
    sig.level = alpha, # 显著性水平
    power = 1 - beta, # 检验功效
    alternative = "two.sided" # 双边检验
)
res2 <- pwr.p.test(
    h = pwr::ES.h(totalp, samplep), # 效应
    sig.level = alpha, # 显著性水平
    n = n, # 样本量
    alternative = "two.sided" # 双边检验
)
print(res1)
print(res2)
# 保存工作空间
save.image("R7.RData")
