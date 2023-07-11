# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap37\\sourcecode")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
# 设置边距
par(mar = c(3, 3, 3, 3))
num <- 0
num1 <- 0
plot(
    0, 0,
    xlim = c(0, 21), # X轴范围
    ylim = c(0.5, 6.5), # Y轴范围
    col = "white", # 白色
    yaxt = "n", # 不显示轴刻度
    ylab = "", # Y轴标题
    xlab = "" # X轴标题
)
for (i in seq(1, 20)) {
    points(i, 1, pch = i, cex = 3)
    points(i, 2, col = i, pch = 16, cex = 3)
    points(i, 3, col = "black", pch = 16, cex = i * 0.25)
    if (i %in% c(seq(1, 18, 3))) {
        num <- num + 1
        points(
            c(i, i + 2), c(4, 4),
            col = "black",
            lty = num, type = "l", lwd = 2
        )
        text(i + 1.1, 4.15, num)
    }
    if (i %in% c(seq(1, 20, 5))) {
        num1 <- num1 + 1
        points(
            c(i, i + 1, i + 2, i + 3), c(5, 5, 5, 5),
            col = "black", type = c("p", "l", "b", "o")[num1],
            lwd = 2
        )
        text(i + 1.1, 5.2, c("p", "l", "b", "o")[num1])
        points(
            c(i, i + 1, i + 2, i + 3), c(6, 6, 6, 6),
            col = "black", type = "l", lwd = num1
        )
        text(i + 1.1, 6.2, num1)
    }
}
# 添加轴刻度
axis(
    2,
    at = c(1, 2, 3, 4, 5, 6),
    labels = c("pch", "col", "cex", "lty", "type", "lwd"),
    tick = TRUE, col = "black", las = 1, cex.axis = 0.8
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R1.RData")
