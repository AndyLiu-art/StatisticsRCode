# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap2\\sourcecode")
# 比例检验
res <- binom.test(
    x = 38, # 试验成功的次数
    n = 200, # 实验总次数
    alternative = "two.sided", # 双边检验
    conf.level = 0.95 # 置信水平
)
print(res)
# 保存工作空间
save.image("R7.RData")
