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
    x = c(1, 2, 1, 2, 1.5),
    y = c(1, 1, 2, 2, 1.5)
)
# 字体对其方式
textalign <- c("bottom-left", "bottom-right", "top-right", "top-left", "center")
# 文本内容
label <- c("刘德华---==", "LDH---==", "Andy刘---==", "德华---==", "华仔---==")
# 指定数据，和横纵轴变量，以及几何对象
p <- ggplot(dataf, aes(x, y)) +
    geom_text(
        aes(
            label = label, # 文本标签
            vjust = "inward", # 字体垂直方向对齐方式
            hjust = "inward" # 字体水平方向对齐方式
        )
    )
# 保存文件
ggsave("../codeimage/code4.pdf")
# 保存工作空间
save.image("R4.RData")
