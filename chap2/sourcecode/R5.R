# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap2\\sourcecode")
# 待估计的数据
x <- c(2.066, 2.063, 2.068, 2.060, 2.067)
y <- c(2.058, 2.057, 2.063, 2.059, 2.060)
res <- var.test(
    x = x, # 样本
    y = y, # 样本
    alternative = "two.sided", # 双边检验
    ratio = 1, # 检验的方差的比例
    conf.level = 0.9 # 置信水平
)
print(res)
# 保存工作空间
save.image("R5.RData")
