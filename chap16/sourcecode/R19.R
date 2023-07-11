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
pdf("../codeimage/code19.pdf")
# 子图的矩阵排列
mat <- matrix(c(1, 2, 3, 3), nrow = 2, byrow = TRUE)
# 按照矩阵排列布局展开图形
layout(mat)
hist(mtcars$mpg, freq = FALSE, col = "purple")
plot(mpg ~ disp, data = mtcars, col = "red")
plot(factor(mtcars$gear), col = "pink", horiz = TRUE, width = 0.8)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R19.RData")
