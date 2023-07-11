# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap37\\sourcecode")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code3.pdf")
# 生成图形
set.seed(1)
x1 <- rnorm(100)
x2 <- rnorm(100) + rep(2, 100)
# 子图
par(mfrow = c(2, 1))
# 绘图
par(mar = c(0, 5, 3, 3))
hist(
    x1,
    main = "", xlim = c(-2, 5),
    ylab = "Frequency for x1", xlab = "",
    ylim = c(0, 25), xaxt = "n", las = 1,
    col = "slateblue1", breaks = 10
)
par(mar = c(5, 5, 0, 3))
hist(
    x2,
    main = "", xlim = c(-2, 5),
    ylab = "Frequency for x2", xlab = "Value of my variable",
    ylim = c(25, 0), las = 1,
    col = "tomato3", breaks = 10
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R3.RData")
