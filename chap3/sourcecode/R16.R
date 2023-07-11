# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 样本
x <- c(1, 2, 3, 4, 5, 6)
y <- c(6, 5, 4, 3, 2, 1)
res <- cor.test(x, y, method = "spearman")
print(res)
# 保存工作空间
save.image("R16.RData")
