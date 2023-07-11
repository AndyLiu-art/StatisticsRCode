# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap11\\sourcecode")
# 样本量
samplesize <- 1000
# 01均匀分布随机数
u <- runif(samplesize)
# 逆变换法生成特定分布
x <- u^(1 / 3)
y <- seq(0, 1, length = 1000)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
# 绘制该随机变量的直方图
hist(
    x, # 样本
    prob = TRUE, # 密度直方图
    main = expression(f(x) == 3 * x^2)
)
lines(y, 3 * y^2)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R1.RData")
