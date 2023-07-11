# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap37\\sourcecode")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code6.pdf")
# 生成数据
data <- data.frame(
    x = seq(1, 10),
    y = sample(seq(1, 15), 10)
)
# 绘制线条
plot(
    data$x, data$y,
    col = rgb(0.2, 0.1, 0.5, 0.9),
    type = "o", lwd = 3, xlab = "", ylab = "size", pch = 20
)
# 填充面积
polygon(
    c(min(data$x), data$x, max(data$x)),
    c(min(data$y), data$y, min(data$y)),
    col = rgb(0.2, 0.1, 0.5, 0.2), border = FALSE
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R6.RData")
