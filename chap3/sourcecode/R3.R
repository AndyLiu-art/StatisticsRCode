# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 待检验的数据
x <- c(20.5, 19.8, 19.7, 20.4, 20.1, 20.0, 19.0, 19.9)
y <- c(20.7, 19.8, 19.5, 20.8, 20.4, 19.6, 20.2)
res1 <- t.test(
    x = x, # 样本
    y = y, # 样本
    alternative = "two.sided" # 双边检验
)
res2 <- t.test(
    x = x, # 样本
    y = y, # 样本
    alternative = "two.sided", # 双边检验
    var.equal = TRUE # 方差相等
)
print(res1)
print(res2)
# 保存工作空间
save.image("R3.RData")
