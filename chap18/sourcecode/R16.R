# 加载ggplot2绘图包
library("ggplot2")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap18\\sourcecode")
# 指定数据，和横纵轴变量，以及几何对象
p <- ggplot(mpg, aes(manufacturer)) +
    geom_bar()
# 保存文件
ggsave("../codeimage/code16.pdf")
# 保存工作空间
save.image("R16.RData")
