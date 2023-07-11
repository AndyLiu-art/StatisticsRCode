# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap25\\sourcecode")
# 系数矩阵
A <- matrix(
    c(0.5, 0.6, 1, 0.6, 1, 0.5, 0.5, 0.4, 1), # 数据
    nrow = 3, # 行数
    byrow = TRUE # 按行排列
)
# 常数向量
b <- c(-1, 2, 1.5)
# 解线性方程组
res <- solve(A, b)
print(res)
# 保存工作空间
save.image("R1.RData")
