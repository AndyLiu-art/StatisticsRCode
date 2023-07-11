# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap2\\sourcecode")
# 比例检验
res1 <- prop.test(
    x = 38, # 试验成功的次数
    n = 200, # 实验总次数
    alternative = "two.sided", # 双边检验
    conf.level = 0.95, # 置信水平
    correct = FALSE # 是否使用连续性修正
)
res2 <- prop.test(
    x = 38, # 试验成功的次数
    n = 200, # 实验总次数
    alternative = "two.sided", # 双边检验
    conf.level = 0.95, # 置信水平
    correct = TRUE # 是否使用连续性修正
)
print(res1)
print(res2)
# 保存工作空间
save.image("R6.RData")
