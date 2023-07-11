# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap27\\sourcecode")
# 设置随机数
set.seed(1)
# 设置样本量
samplesize <- 100
# 生成x
x <- (1:samplesize) / 100
# 生成y
y <- cos(2 * pi * exp(x)) * exp(x) + rnorm(samplesize, 0, 0.4)
# 合并为dataframe
dataf <- data.frame(x, y)
# 局部多项式回归拟合
res <- loess(
    y ~ x, # 公式
    data = dataf, # 数据
    span = 0.5, # 平滑系数
    degree = 2 # 多项式的阶数，这是最高的
)
print(summary(res))
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code7.pdf")
# 绘制散点图
plot(x, y, data = dataf)
# 绘制核密度曲线
lines(res, type = "l")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R7.RData")
