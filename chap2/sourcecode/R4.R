# 加载z检验的包
library("BSDA")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap2\\sourcecode")
# 待估计的数据
x <- c(860, 870, 560, 930, 840, 930, 750, 790)
y <- c(800, 790, 580, 910, 870, 820, 740, 760)
# 总体方差已知
res1 <- BSDA::z.test(
    x = x, # 样本
    y = y, # 样本
    alternative = "two.sided", # 双边检验
    sigma.x = sqrt(100), # 总体标准差
    sigma.y = sqrt(120), # 总体标准差
    conf.level = 0.95 # 置信水平
)
# 总体方差未知且相等
res2 <- t.test(
    x = x, # 样本
    y = y, # 样本
    alternative = "two.sided", # 双边检验
    var.equal = TRUE, # 方差相等
    conf.level = 0.95 # 置信水平
)
# 配对样本
res3 <- t.test(
    x = x, # 样本
    y = y, # 样本
    alternative = "two.sided", # 双边检验
    paired = TRUE, # 配对样本
    conf.level = 0.95 # 置信水平
)
# 方差未知且不相等
res4 <- t.test(
    x = x, # 样本
    y = y, # 样本
    alternative = "two.sided", # 双边检验
    conf.level = 0.95 # 置信水平
)
print(res1)
print(res2)
print(res3)
print(res4)
# 保存工作空间
save.image("R4.RData")
