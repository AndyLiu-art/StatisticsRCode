# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap2\\sourcecode")
# 总实验次数的向量
people <- c(1000, 750)
# 试验成功次数的向量
like <- c(478, 246)
# 比例检验
res <- prop.test(
    like, # 样本
    people, # 总样本量
    alternative = "two.sided", # 双边检验
    conf.level = 0.95, # 置信水平
    correct = TRUE # 是否使用连续性修正
)
print(res)
# 保存工作空间
save.image("R8.RData")
