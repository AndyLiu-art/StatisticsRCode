# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap7\\sourcecode")
# 计算距离矩阵
d <- dist(iris[, 1:4])
# 层次聚类法
hc <- hclust(d) # 最短距离法
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf")
# 这里必须绘图
plot(
    hc, # 层次聚类对象
    label = FALSE, # 不绘制标签
    hang = -1
)
res <- rect.hclust(
    hc, # hclust的聚类结果
    k = 3, # 需要聚成多少类
    border = "blue" # 边框线是蓝色
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R4.RData")
