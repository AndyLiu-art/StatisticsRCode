# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap31\\sourcecode")
# 加载数据
data(alcohol, package = "KFAS")
# 年龄分组标签
ldg <- paste("age", c("30-39", "40-49", "50-59", "60,69"))
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf")
par(mfrow = c(1, 2))
# 时间序列线图
plot.ts(alcohol[, 1:4], plot.type = "single", lty = 1:4, col = 1:4, lwd = 3)
# 图例
legend("topleft", ldg, lty = 1:4, col = 1:4, lwd = 3)
# 时间序列线图
plot.ts(alcohol[, 5:8], plot.type = "single", lty = 1:4, col = 1:4, lwd = 3)
# 图例
legend("bottomright", ldg, lty = 1:4, col = 1:4, lwd = 3)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R4.RData")
