# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
# 样本
x <- c(318, 910, 200, 409, 425, 502, 314, 1210, 1022, 1225)
y <- c(524, 1019, 638, 815, 913, 928, 605, 1516, 1219, 1624)
# 线性回归拟合
lmod <- lm(
    y ~ x # 默认有截距项
)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
# 回归诊断图
par(mfrow = c(2, 2))
plot(lmod)
# 关闭图形
dev.off()
# 保存文件
dev.off()
# 保存工作空间
save.image("R3.RData")
