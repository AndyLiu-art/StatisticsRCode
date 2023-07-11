# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap14\\sourcecode")
# 设置随机数种子
set.seed(1)
# 样本量
samplesize <- 100
# MA序列1
x1 <- arima.sim(
    n = samplesize, # 样本量
    list(ar = c(0.5, 0.3))
)
# MA序列2
x2 <- arima.sim(
    n = samplesize, # 样本量
    list(ar = c(0.5, -0.5))
)
# MA序列3
x3 <- arima.sim(
    n = samplesize, # 样本量
    list(ar = c(-0.75, -0.3))
)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code4.pdf")
# 设置子图
par(mfrow = c(3, 1))
# 偏自相关函数图
pacf(x1)
pacf(x2)
pacf(x3)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R4.RData")
