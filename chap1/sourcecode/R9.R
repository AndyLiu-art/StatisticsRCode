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
# 二维频率列联表
prob <- matrix(
    c(0.42, 0.28, 0.03, 0.07, 0.10, 0.10), # 数据
    byrow = TRUE, # 按行排列
    nrow = 3 # 行数
)
res1 <- pwr::pwr.chisq.test(
    w = pwr::ES.w2(prob), # 效应
    df = 2, # 自由度
    sig.level = alpha, # 显著性水平
    power = 1 - beta # 检验功效
)
res2 <- pwr::pwr.chisq.test(
    w = pwr::ES.w2(prob), # 效应
    df = 2, # 自由度
    sig.level = alpha, # 显著性水平
    N = n # 样本量
)
print(res1)
print(res2)
# 保存工作空间
save.image("R9.RData")
