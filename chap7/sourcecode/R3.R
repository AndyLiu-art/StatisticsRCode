# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap7\\sourcecode")
dataf <- matrix(
    c(1, 2, 4.5, 6, 8), # 数据
    nrow = 5, # 行数
    byrow = TRUE # 按行排列
)
# 计算距离矩阵
d <- dist(dataf)
# 层次聚类法
hc1 <- hclust(d, "single") # 最短距离法
hc2 <- hclust(d, "complete") # 最长距离法
hc3 <- hclust(d, "median") # 中间距离法
hc4 <- hclust(d, "ward.D") # 离差平方和法
hc5 <- hclust(d, "average") # 类平均法
hc6 <- hclust(d, "centroid") # 重心法
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
opar <- par(mfrow = c(3, 2))
plot(hc1, hang = -1)
plot(hc2, hang = -1)
plot(hc3, hang = -1)
plot(hc4, hang = -1)
plot(hc5, hang = -1)
plot(hc6, hang = -1)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R3.RData")
