# 设置工作目录
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap1\\sourcecode")
# 加载功效检验的包
library("pwr")
# 第一类错误概率控制
alpha <- 0.05
# 第二类错误概率控制
beta <- 0.1
# 样本量
n <- 20
# 组数
k <- 3
# 总体标准差
sigma <- 4.5
# 组均值
mus <- c(8, 15, 9)
# 总体均值
mu <- 11
# 效应大小
f <- sqrt(sum((mus - mu)^2) / k / (sigma^2))
res1 <- pwr::pwr.anova.test(
    k = k, # 组数
    f = f, # 效应
    sig.level = alpha, # 显著性水平
    power = 1 - beta # 检验功效
)
res2 <- pwr::pwr.anova.test(
    k = k, # 组数
    f = f, # 效应
    sig.level = alpha, # 显著性水平
    n = n # 样本量
)
print(res1)
print(res2)
# 保存工作空间
save.image("R4.RData")
