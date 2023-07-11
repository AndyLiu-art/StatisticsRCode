# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap31\\sourcecode")
# 建立局部水平模型
res <- StructTS(Nile, type = "level")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
# 散点图
plot(Nile, type = "o", lty = 1)
# 拟合线
lines(fitted(res), lty = 2, col = 2, lwd = 2)
# 滤波平滑线
lines(tsSmooth(res), lty = 3, col = 3, lwd = 2)
# 图例
legend(
    "bottomleft",
    c("Nile", "State", "Smoothed"),
    lty = 1:3,
    col = 1:3,
    pch = c(1, NA, NA)
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R1.RData")
