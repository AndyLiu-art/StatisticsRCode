# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap27\\sourcecode")
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
# 平滑样本点
res <- lowess(
    x, # X坐标
    y, # Y坐标
    f = 2 / 3 # 参与平滑的样本点比例
)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code6.pdf")
# 绘制散点图
plot(x, y, data = dataf)
# 绘制核密度曲线，必须是dataf$这种形式
lines(res, type = "l")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R6.RData")
