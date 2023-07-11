# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap11\\sourcecode")
# 样本量
samplesize <- 1000
# 均值向量
mu <- rep(0, 2)
# 协方差阵
Sigma <- matrix(c(1, 0.9, 0.9, 1), nrow = 2, byrow = TRUE)
rwishart <- function(samplesize, mu, Sigma) {
    # 维度
    d <- length(mu)
    # 生成矩阵T
    T <- matrix(rep(0, d * d), nrow = d, byrow = TRUE)
    for (i in 1:d) {
        for (j in 1:d) {
            if (i > j) {
                T[i, j] <- rnorm(1)
            } else if (i == j) {
                T[i, i] <- sqrt(rchisq(1, df = samplesize - i + 1))
            } else {
                T[i, j] <- 0
            }
        }
    }
    # 生成矩阵A
    A <- T %*% t(T)
    # chol分解，将它转为下三角
    L <- t(chol(Sigma))
    # Wishart分布
    X <- L %*% A %*% t(L)
    return(X)
}
X <- rwishart(samplesize, mu, Sigma)
print(X)
# 保存工作空间
save.image("R8.RData")
