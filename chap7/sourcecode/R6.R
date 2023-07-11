# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap7\\sourcecode")
# 相关系数矩阵
x <- c(
    1.000, 0.846, 0.805, 0.859, 0.473, 0.398, 0.301, 0.382,
    0.846, 1.000, 0.881, 0.826, 0.376, 0.326, 0.277, 0.277,
    0.805, 0.881, 1.000, 0.801, 0.380, 0.319, 0.237, 0.345,
    0.859, 0.826, 0.801, 1.000, 0.436, 0.329, 0.327, 0.365,
    0.473, 0.376, 0.380, 0.436, 1.000, 0.762, 0.730, 0.629,
    0.398, 0.326, 0.319, 0.329, 0.762, 1.000, 0.583, 0.577,
    0.301, 0.277, 0.237, 0.327, 0.730, 0.583, 1.000, 0.539,
    0.382, 0.415, 0.345, 0.365, 0.629, 0.577, 0.539, 1.000
)
# 矩阵的行列名
names <- c("身高", "手臂长", "上肢长", "下肢长", "体重", "颈维", "胸围", "胸宽")
# 构造相关系数矩阵
r <- matrix(x, nrow = 8, dimnames = list(names, names))
# 将它转为距离矩阵，注意是1-r。距离越远，相关性越小。
d <- as.dist(1 - r)
# 层次聚类
hc <- hclust(d)
# 获得谱系图对象
dend <- as.dendrogram(hc)
nP <- list(
    col = 3:2, cex = c(2.0, 0.75), pch = 21:22,
    bg = c("light blue", "pink"),
    lab.cex = 1.0, lab.col = "tomato"
)
addE <- function(n) {
    if (!is.leaf(n)) {
        attr(n, "edgePar") <- list(p.col = "plum")
        attr(n, "edgetext") <- paste(attr(n, "members"), "members")
    }
    n
}
# 将addE函数作用在谱系图对象dend上
de <- dendrapply(dend, addE)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code4.pdf", width = 8, height = 8)
plot(de, nodePar = nP)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R6.RData")
