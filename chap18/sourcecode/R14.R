# 加载ggplot2绘图包
library("ggplot2")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap18\\sourcecode")
# 指定数据，和横纵轴变量，以及几何对象
p <- ggplot(mpg, aes(hwy)) +
    geom_density(bins = 30)
# 保存文件
ggsave("../codeimage/code14.pdf")
# 保存工作空间
save.image("R14.RData")
