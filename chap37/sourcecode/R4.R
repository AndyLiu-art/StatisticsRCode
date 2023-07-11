# 加载vioplot库
library("vioplot")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap37\\sourcecode")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code4.pdf")
# 生成数据
treatment <- c(rep("A", 40), rep("B", 40), rep("C", 40))
value <- c(
    sample(2:5, 40, replace = TRUE),
    sample(c(1:5, 12:17), 40, replace = TRUE),
    sample(1:7, 40, replace = TRUE)
)
data <- data.frame(treatment, value)
# Draw the plot
with(data, vioplot::vioplot(
    value[treatment == "A"],
    value[treatment == "B"],
    value[treatment == "C"],
    col = rgb(0.1, 0.4, 0.7, 0.7),
    names = c("A", "B", "C")
))
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R4.RData")
