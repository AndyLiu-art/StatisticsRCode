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
    waiting = c(55, 80),
    eruptions = c(2, 4.3),
    label <- c("peak one", "peak two")
)
# 文本标签
# 指定数据，和横纵轴变量，以及几何对象
p <- ggplot(faithfuld, aes(waiting, eruptions)) +
    geom_tile(aes(fill = density)) +
    geom_label(
        data = dataf, # 带有标签的数据集
        aes(label = label) # 给出标签在dataframe的列名
    )
# 保存文件
ggsave("../codeimage/code8.pdf")
# 保存工作空间
save.image("R8.RData")
