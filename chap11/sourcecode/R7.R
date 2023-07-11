# 加载生成多元正态分布的包
library("MASS")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap11\\sourcecode")
# 样本量
samplesize <- 1000
# 均值向量
mu <- rep(0, 2)
# 协方差阵
Sigma <- matrix(c(1, 0.9, 0.9, 1), nrow = 2, byrow = TRUE)
rwishart <- function(samplesize, mu, Sigma) {
    # 生成多元正态分布随机数
    X <- MASS::mvrnorm(samplesize, mu = mu, Sigma = Sigma)
    # Wishart分布
    M <- t(X) %*% X
    return(M)
}
M <- rwishart(samplesize, mu, Sigma)
print(M)
# 保存工作空间
save.image("R7.RData")
