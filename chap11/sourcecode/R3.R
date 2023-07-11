# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap11\\sourcecode")
# 样本量
samplesize <- 1000
# 接受的个数
k <- 0
# 迭代次数
iter_count <- 0
# 常数c
c <- 6
# 用于接受随机变量的向量
y <- NULL
while (k < samplesize) {
    # 均匀分布随机数
    u <- runif(1)
    # 迭代次数增加
    iter_count <- iter_count + 1
    # 建议分布
    x <- runif(1)
    if (u < 6 * x * (1 - x) / c) {
        # 满足条件，将x加入向量
        y <- c(y, x)
        k <- k + 1
    }
}
print("共进行了多少次抽样：")
print(iter_count)
yy <- seq(0, 1, length = 1000)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code3.pdf")
# 绘制该随机变量的直方图
hist(
    y, # 样本
    prob = TRUE, # 密度直方图
    main = expression(f(x) == 6 * x * (1 - x))
)
lines(yy, c * yy * (1 - yy))
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R3.RData")
