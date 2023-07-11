# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap16\\sourcecode")
# x
x <- seq(-2, 2, length = 100)
# y
y <- seq(-2, 2, length = 100)
# 二元函数
f <- function(x, y) {
    return(x^2 + y^2)
}
# 计算函数值z
z <- outer(x, y, f)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code11.pdf")
# 三维函数图
image(
    x, # X轴
    y, # Y轴
    z, # Z轴
    main = "二元函数值热图"
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R11.RData")
