# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap14\\sourcecode")
# ARMA模型自相关系数
x1 <- ARMAacf(
    ma = c(0.5, -0.4), # 系数
    lag.max = 15 # 最大滞后数
)
# ARMA模型偏自相关系数
x2 <- ARMAacf(
    ar = c(-0.5, 0.4), # 系数
    lag.max = 15, # 最大滞后数
    pacf = TRUE # 计算偏自相关系数
)
# ARMA模型自相关系数
x3 <- ARMAacf(
    ma = c(-0.3, 0.25), # MA模型系数
    ar = c(-0.3, 0.4), # AR模型系数
    lag.max = 15 # 最大滞后数
)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code6.pdf")
# 设置子图
par(mfrow = c(3, 1))
# 偏自相关函数图
plot(x1, type = "h")
abline(h = 0)
plot(x2, type = "h")
abline(h = 0)
plot(x3, type = "h")
abline(h = 0)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R6.RData")
