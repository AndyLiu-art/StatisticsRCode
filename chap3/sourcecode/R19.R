# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 样本
x <- c(18.0, 17.1, 16.4, 16.9, 16.9, 16.7, 16.7, 17.2, 17.5, 16.9)
y <- c(17.0, 16.9, 17.0, 16.9, 17.2, 17.1, 16.8, 17.1, 17.1, 17.2)
res <- ansari.test(x, y, alternative = "two.sided")
print(res)
# 保存工作空间
save.image("R19.RData")
