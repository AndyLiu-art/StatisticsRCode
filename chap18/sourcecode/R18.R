# 加载ggplot2绘图包
library("ggplot2")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap18\\sourcecode")
# 生成一个数据集
dataf <- data.frame(
    drug = c("a", "b", "c", "d"),
    effect = c(1, 3.2, 5.1, 0.9)
)
# 指定数据，和横纵轴变量，以及几何对象
p <- ggplot(dataf, aes(drug, effect)) +
    geom_point()
# 保存文件
ggsave("../codeimage/code18.pdf")
# 保存工作空间
save.image("R18.RData")
