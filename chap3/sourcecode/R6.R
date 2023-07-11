# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
res1 <- binom.test(
    x = 5, # 试验成功的次数
    n = 12, # 实验总次数
    p = 0.4, # 检验的概率
    alternative = "two.sided" # 双边检验
)
res2 <- prop.test(
    x = 5, # 试验成功的次数
    n = 12, # 实验总次数
    p = 0.4, # 检验的概率
    correct = FALSE, # 不作正态修正
    alternative = "two.sided" # 双边检验
)
print(res1)
print(res2)
# 保存工作空间
save.image("R6.RData")
