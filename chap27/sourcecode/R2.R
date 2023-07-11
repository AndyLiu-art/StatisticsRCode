# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap27\\sourcecode")
kernal_lm <- function(px, x, y, kfun, h) {
    # px是核估计选取的点，x,y是原始数据
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
samplesize <- 500
# 生成x
x <- rnorm(samplesize)
# 生成y
y <- x^2 + rnorm(samplesize, 0, 0.4)
# 合并为dataframe
dataf <- data.frame(x, y)
# 核估计
ny <- sapply(x, kernal_lm, x = x, y = y, dnorm, h = 0.2)
# 将ny作为新一列加入到dataframe
dataf$ny <- ny
# 按照x排序
dataf <- dataf[order(x), ]
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf")
# 绘制散点图
plot(x, y, data = dataf)
# 绘制核密度曲线，必须是dataf$这种形式
lines(dataf$x, dataf$ny, type = "l")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R2.RData")
