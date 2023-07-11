# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap11\\sourcecode")
# 样本量
samplesize <- 1000
runif_d <- function(samplesize, d) {
    # 正态分布的随机数
    M <- matrix(rnorm(samplesize * d), nrow = samplesize, byrow = TRUE)
    # 计算M的每一行的二范数
    L <- apply(M, 1, function(x) {
        sqrt(sum(x * x))
    })
    # 多维均匀分布随机数
    U <- diag(1 / L) %*% M
    return(U)
}
X <- runif_d(samplesize, 2)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code7.pdf")
# 绘制散点图
plot(X, xlab = "x1", ylab = "x2", bty = "n")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R9.RData")
