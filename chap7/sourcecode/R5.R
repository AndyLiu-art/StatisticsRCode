# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap7\\sourcecode")
x1 <- c(5, 7, 3, 6, 6)
x2 <- c(7, 1, 2, 5, 6)
# 将列向量合并为矩阵
dataf <- cbind(x1, x2)
# 计算距离矩阵
d <- dist(dataf)
# 层次聚类法
hc <- hclust(d)
# 聚类谱系对象
res <- as.dendrogram(hc)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code3.pdf", width = 7, height = 7)
par(mfrow = c(2, 2), mar = c(4, 3, 1, 2))
# 正常的谱系图
plot(res)
# 三角性的谱系图
plot(
    res, # 谱系图对象
    nodePar = list(pch = c(1, NA), cex = 0.8, lab.cex = 0.8), # 节点参数
    type = "triangle", # 三角状的谱系图
    center = TRUE # 中心化
)
plot(
    res, # 谱系图对象
    edgePar = list(col = 1:2, lty = 2:3), # 边缘参数
    dLeaf = 1, # 叶子
    edge.root = TRUE # 显示
)
# 水平谱系图
plot(
    res, # 谱系图对象
    nodePar = list(pch = 2:1, cex = .4 * 2:1, col = 2:3), # 节点参数
    horiz = TRUE # 绘制水平图
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R5.RData")
