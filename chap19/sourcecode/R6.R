# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 加载ggplot2绘图包
library("ggplot2")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap19\\sourcecode")
# 生成数据
dataf <- data.frame(
    x = c(1.2, 3.4, 2.5),
    y = c("a", "b", "c")
)
# 指定数据，和横纵轴变量，以及几何对象
p <- ggplot(dataf, aes(x, y)) +
    geom_point() +
    geom_text(
        aes(
            label = paste("(", x, ")", sep = "") # 文本标签
        ),
        nudge_y = -0.1, # 垂直方向下降0.25个单位
        nudge_x = 0.05 # 水平方向向右移动0.25个单位
    )
# 保存文件
ggsave("../codeimage/code6.pdf")
# 保存工作空间
save.image("R6.RData")
