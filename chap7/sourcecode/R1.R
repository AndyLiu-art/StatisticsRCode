# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap7\\sourcecode")
x1 <- c(5, 7, 3, 6, 6)
x2 <- c(7, 1, 2, 5, 6)
# 将列向量合并为矩阵
dataf <- cbind(x1, x2)
# 计算距离
res1 <- dist(dataf)
res2 <- dist(dataf, diag = TRUE)
res3 <- dist(dataf, upper = TRUE)
res4 <- dist(dataf, method = "manhattan") # 曼哈顿距离
res5 <- dist(dataf, method = "minkowski", p = 1) # 明可夫斯基距离
res6 <- dist(dataf, method = "minkowski", p = 2) # 明可夫斯基距离
print(res1)
print(res2)
print(res3)
print(res4)
print(res5)
# 保存工作空间
save.image("R1.RData")
