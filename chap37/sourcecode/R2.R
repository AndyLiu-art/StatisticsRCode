# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap37\\sourcecode")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf")
# 设置图形的边距
par(oma = c(3, 3, 3, 3)) # all sides have 3 lines of space
par(mar = c(5, 4, 4, 2) + 0.1)
# 不绘制图形
plot(
    0:10, 0:10,
    type = "n",
    xlab = "X", ylab = "Y"
)
text(5, 5, "Plot", col = "red", cex = 2)
# 为图形添加边框
box(col = "red")
# 边距上的文本
mtext(
    "Margins",
    side = 3, line = 2,
    cex = 2, col = "forestgreen"
)
mtext(
    "par(mar=c(b,l,t,r))",
    side = 3,
    line = 1, cex = 1, col = "forestgreen"
)
mtext(
    "Line 0",
    side = 3, line = 0,
    adj = 1.0, cex = 1, col = "forestgreen"
)
mtext(
    "Line 1",
    side = 3, line = 1,
    adj = 1.0, cex = 1, col = "forestgreen"
)
mtext(
    "Line 2",
    side = 3, line = 2,
    adj = 1.0, cex = 1, col = "forestgreen"
)
mtext(
    "Line 3",
    side = 3, line = 3,
    adj = 1.0, cex = 1, col = "forestgreen"
)
# 为figure添加边框
box("figure", col = "forestgreen")
# 边距上的文本
mtext(
    "Outer Margin Area",
    side = 1, line = 1,
    cex = 2, col = "blue", outer = TRUE
)
mtext(
    "par(oma=c(b,l,t,r))",
    side = 1, line = 2,
    cex = 1, col = "blue", outer = TRUE
)
mtext(
    "Line 0",
    side = 1, line = 0, adj = 0.0,
    cex = 1, col = "blue", outer = TRUE
)
mtext(
    "Line 1",
    side = 1, line = 1, adj = 0.0,
    cex = 1, col = "blue", outer = TRUE
)
mtext(
    "Line 2",
    side = 1, line = 2, adj = 0.0,
    cex = 1, col = "blue", outer = TRUE
)
box("outer", col = "blue")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R2.RData")
