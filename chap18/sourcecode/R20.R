# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 加载ggplot2绘图包
library("ggplot2")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap18\\sourcecode")
# 指定数据，和横纵轴变量，以及几何对象
p <- ggplot(economics, aes(date, unemploy)) +
    geom_line() +
    xlab("日期") +
    ylab("失业人口")
# 保存文件
ggsave("../codeimage/code20.pdf")
# 保存工作空间
save.image("R20.RData")
