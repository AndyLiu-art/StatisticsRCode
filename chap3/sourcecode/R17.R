# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 样本
x <- c(86, 77, 68, 91, 70, 71, 85, 87, 63)
y <- c(88, 76, 64, 96, 65, 80, 81, 72, 60)
res <- cor.test(x, y, method = "kendall")
print(res)
# 保存工作空间
save.image("R17.RData")
