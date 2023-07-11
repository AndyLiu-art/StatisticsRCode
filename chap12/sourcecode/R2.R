# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap12\\sourcecode")
# 样本量
m <- 1000
# 积分上限
b <- 4
# 积分下限
a <- 2
# 均匀分布随机数
u <- runif(m, a, b)
# 积分估计值
I <- (b - a) * mean(exp(-u))
print("蒙特卡洛积分估计值为：")
print(I)
# 使用R自带函数计算定积分
I_value <- integrate(function(x) {
    exp(-x)
}, a, b)
print("R语言计算积分函数之为：")
print(I_value)
# 保存工作空间
save.image("R2.RData")
