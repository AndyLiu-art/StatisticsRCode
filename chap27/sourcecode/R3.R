# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap27\\sourcecode")
k_near_kernal <- function(px, x, y, kfun, k) {
    # px是核估计选取的点，x,y是原始数据
    h <- sort(abs(px - x))[k]
    # 权重求和
    weight_all <- sum(kfun((x - px) / h))
    # 权重
    weight <- kfun((x - px) / h) / weight_all
    # 核估计的结果y
    py <- sum(weight * y)
    return(py)
}
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
# 核估计
ny <- sapply(x, k_near_kernal, x = x, y = y, dnorm, k = 5)
# 按照x排序
dataf <- dataf[order(x), ]
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code3.pdf")
# 绘制散点图
plot(dataf)
# 绘制核密度曲线
lines(x, ny, type = "l")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R3.RData")
