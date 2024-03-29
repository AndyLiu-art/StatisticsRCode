# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap8\\sourcecode")
student <- data.frame(
    X1 = c(
        148, 139, 160, 149, 159, 142, 153, 150, 151, 139,
        140, 161, 158, 140, 137, 152, 149, 145, 160, 156,
        151, 147, 157, 147, 157, 151, 144, 141, 139, 148
    ),
    X2 = c(
        41, 34, 49, 36, 45, 31, 43, 43, 42, 31,
        29, 47, 49, 33, 31, 35, 47, 35, 47, 44,
        42, 38, 39, 30, 48, 36, 36, 30, 32, 38
    ),
    X3 = c(
        72, 71, 77, 67, 80, 66, 76, 77, 77, 68,
        64, 78, 78, 67, 66, 73, 82, 70, 74, 78,
        73, 73, 68, 65, 80, 74, 68, 67, 68, 70
    ),
    X4 = c(
        78, 76, 86, 79, 86, 76, 83, 79, 80, 74,
        74, 84, 83, 77, 73, 79, 79, 77, 87, 85,
        82, 78, 80, 75, 88, 80, 76, 76, 73, 78
    )
)
# 主成分分析
pr <- princomp(
    student, # 样本
    cor = TRUE # 使用相关系数矩阵做主成分
)
# 主成分的贡献率
res <- summary(pr)
# 主成分的具体值
y <- predict(pr)
# 载荷矩阵
Q <- loadings(pr)
print(res)
print(y)
print(Q)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
# 碎石图
screeplot(pr, type = "lines")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R1.RData")
