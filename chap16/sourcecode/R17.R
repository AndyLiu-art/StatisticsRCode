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
pdf("../codeimage/code17.pdf")
plot(
    iris$Sepal.Length[1:50],
    iris$Sepal.Width[1:50],
    xlab = "Sepal.Length",
    ylab = "Sepal.Width",
    col = "purple"
)
grid(col = "green")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R17.RData")
