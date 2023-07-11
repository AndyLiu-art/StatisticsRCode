# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap16\\sourcecode")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code16.pdf")
x <- seq(-2, 2, length = 20)
y <- seq(-2, 2, length = 20)
# 空白图
plot(
    x, y,
    type = "n",
    axes = FALSE, ann = FALSE
)
# 添加标题
title(main = "简易五子棋棋盘")
# 添加线段
for (i in x) {
    segments(
        x0 = i,
        y0 = -2,
        x1 = i,
        y1 = 2,
        col = "black", lwd = 2
    )
}
for (j in y) {
    segments(
        x0 = -2,
        y0 = j,
        x1 = 2,
        y1 = j,
        col = "black", lwd = 2
    )
}
# 添加棋子
for (i in 1:20) {
    if (i %% 2 == 0) {
        points(
            x = x[i], y = y[i], col = "white", pch = 16, cex = 2
        )
    }
    if (i %% 3 == 0) {
        points(
            x = x[i], y = y[i], col = "black", pch = 16, cex = 3
        )
    }
}
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R16.RData")
