# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap7\\sourcecode")
x1 <- c(5, 7, 3, 6, 6)
x2 <- c(7, 1, 2, 5, 6)
# 将列向量合并为矩阵
dataf <- cbind(x1, x2)
# 中心化
res1 <- scale(dataf, scale = FALSE)
# 标准化
res2 <- scale(dataf)
print(res1)
print(res2)
# 保存工作空间
save.image("R2.RData")
