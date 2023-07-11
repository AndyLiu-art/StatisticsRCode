# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap14\\sourcecode")
# 设置随机数种子
set.seed(1)
# 样本量
samplesize <- 100
# 正态白噪声
x <- rnorm(samplesize)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
# 设置子图
par(mfrow = c(2, 1))
# 时间序列线图
ts.plot(x)
# 自相关函数图
acf(x)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R1.RData")
