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
pdf("../codeimage/code20.pdf")
rx <- range(x <- 10 * 1:nrow(volcano))
ry <- range(y <- 10 * 1:ncol(volcano))
ry <- ry + c(-1, 1) * (diff(rx) - diff(ry)) / 2
filled.contour(x, y, volcano)
title("A Topographic Map of Maunga Whau", font = 4)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R20.RData")
