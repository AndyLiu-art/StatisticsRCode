# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 样本
x <- c(42, 44, 38, 52, 48, 46, 34, 44, 38)
y <- c(34, 43, 35, 33, 34, 26, 30, 31, 31, 27, 28, 27, 30, 37, 32)
res <- wilcox.test(
    x = x, # 样本1
    y = y, # 样本2
    alternative = "two.sided" # 双边检验
)
print(res)
# 保存工作空间
save.image("R13.RData")
