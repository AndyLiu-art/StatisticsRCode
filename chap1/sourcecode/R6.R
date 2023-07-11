# 设置工作目录
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap1\\sourcecode")
# 加载功效检验的包
library("pwr")
# 第一类错误概率控制
alpha <- 0.05
# 第二类错误概率控制
beta <- 0.1
# 回归模型中自变量个数
k <- 3
# 样本量
n <- 20
# 分子自由度
u <- k
# 分母自由度
v <- n - k - 1
# R方
Rsquare <- 0.7
# 效应大小
f2 <- Rsquare / (1 - Rsquare)
res1 <- pwr::pwr.f2.test(
    u = u, # 分子自由度
    f2 = f2, # 效应
    sig.level = alpha, # 显著性水平
    power = 1 - beta # 检验功效
)
res2 <- pwr::pwr.f2.test(
    u = u, # 分子自由度
    f2 = f2, # 效应
    sig.level = alpha, # 显著性水平
    v = v # 分母自由度
)
print(res1)
print(res2)
# 保存工作空间
save.image("R6.RData")
