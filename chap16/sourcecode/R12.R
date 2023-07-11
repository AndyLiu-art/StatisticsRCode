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
y <- x^2 - 2 * x + 4
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code12.pdf")
# 曲线图
plot(
    x, # X轴
    y, # Y轴
    type = "l", # 线图
    col = "red", # 线条颜色
    xlab = "自变量", # 横轴标签
    ylab = "因变量", # 纵轴标签
    main = "函数曲线图"
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R12.RData")
