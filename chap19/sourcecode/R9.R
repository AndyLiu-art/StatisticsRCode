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
# 加载数据集
data(Oxboys, package = "nlme")
# 文本标签
# 指定数据，和横纵轴变量，以及几何对象
p <- ggplot(Oxboys, aes(age, height, group = Subject)) +
    geom_point() +
    geom_line()
# 保存文件
ggsave("../codeimage/code9.pdf")
# 保存工作空间
save.image("R9.RData")
