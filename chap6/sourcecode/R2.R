# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap6\\sourcecode")
# 距离判别函数，多类别
distinguish_distance <- function(TrnX, TrnG, TstX = NULL, var_equal = FALSE) {
    # TrnX是训练集的X
    # TrnG是训练集的分类因子
    # TstX是测试集的X
    # 下面是提取行数，做数据的强制转换
    if (is.factor(TrnG) == FALSE) {
        mx <- nrow(TrnX)
        mg <- nrow(TrnG)
        TrnX <- rbind(TrnX, TrnG)
        TrnG <- factor(rep(1:2, c(mx, mg)))
    }
    if (is.null(TstX) == TRUE) {
        TstX <- TrnX
    }
    if (is.vector(TstX) == TRUE) {
        TstX <- t(as.matrix(TstX))
    } else if (is.matrix(TstX) != TRUE) {
        TstX <- as.matrix(TstX)
    }
    if (is.matrix(TrnX) != TRUE) {
        TrnX <- as.matrix(TrnX)
    }
    # 提取测试集的行数
    nx <- nrow(TstX)
    # 定义所属类别的矩阵
    blong <- matrix(rep(0, nx),
        nrow = 1,
        dimnames = list("blong", 1:nx)
    )
    # 类别数
    g <- length(levels(TrnG))
    # 下面是计算样本到类别之间马氏距离
    mu <- matrix(0, nrow = g, ncol = ncol(TrnX))
    for (i in 1:g) {
        mu[i, ] <- colMeans(TrnX[TrnG == i, ])
    }
    D <- matrix(0, nrow = g, ncol = nx)
    if (var_equal == TRUE || var_equal == T) {
        for (i in 1:g) {
            D[i, ] <- mahalanobis(TstX, mu[i, ], var(TrnX))
        }
    } else {
        for (i in 1:g) {
            D[i, ] <- mahalanobis(TstX, mu[i, ], var(TrnX[TrnG == i, ]))
        }
    }
    for (j in 1:nx) {
        dmin <- Inf
        for (i in 1:g) {
            if (D[i, j] < dmin) {
                dmin <- D[i, j]
                blong[j] <- i
            }
        }
    }
    return(blong)
}
# 提取Iris数据集的X
X <- iris[, 1:4]
# 定义分类变量，必须是数值型的因子变量
G <- gl(3, 50)
res <- distinguish_distance(X, G)
print(res)
# 保存工作空间
save.image("R2.RData")
