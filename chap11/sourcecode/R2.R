# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap11\\sourcecode")
# 样本量
samplesize <- 1000
# 参数lambda
lambda <- 3
# 01均匀分布随机数
u <- runif(samplesize)
# 逆变换法生成特定分布
x <- -log(1 - u) / lambda
y <- seq(0, 10, length = 1000)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf")
# 绘制该随机变量的直方图
hist(
    x, # 样本
    prob = TRUE, # 密度直方图
    main = expression(f(x) == lambda * exp(-lambda * x))
)
lines(y, lambda * exp(-lambda * y))
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R2.RData")
