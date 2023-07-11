# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap11\\sourcecode")
# 样本量
samplesize <- 1000
# 均值向量
mu <- rep(0, 2)
# 协方差阵
Sigma <- matrix(c(1, 0.9, 0.9, 1), nrow = 2, byrow = TRUE)
rmv_eigen <- function(samplesize, mu, Sigma) {
    # 维度
    d <- length(mu)
    # SVD分解
    ev <- svd(Sigma)
    # 特征值
    lambda <- ev$d
    # 变换矩阵
    Q <- ev$u %*% diag(sqrt(lambda)) %*% t(ev$v)
    # 生成正态分布的随机数
    Z <- matrix(rnorm(samplesize * d), nrow = samplesize, byrow = TRUE)
    # 多元正态分布，每一行是随机向量
    X <- Z %*% Q +
        matrix(rep(1, samplesize), nrow = samplesize) %*% matrix(mu, ncol = d)
    return(X)
}
X <- rmv_eigen(samplesize, mu, Sigma)
print("随机数的样本相关系数矩阵：")
print(cor(X))
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code5.pdf")
# 绘制散点图
plot(X, xlab = "x1", ylab = "x2", bty = "n")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R5.RData")
