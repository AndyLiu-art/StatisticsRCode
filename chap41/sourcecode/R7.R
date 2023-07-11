# 加载purrr
library("purrr")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap41\\sourcecode")
library(MASS)

# 生成系数
generate_coef <- function(p, rho, alphas, alphat) {
    # 二维正态分布的均值向量
    mu <- rep(0, 2)
    # 二维正态分布的协方差矩阵
    sigma <- matrix(
        c(alphas^2, rho * alphas * alphat, rho * alphas * alphat, alphat^2),
        byrow = TRUE, nrow = 2
    ) / p
    # 第一个参数是样本量，第二个参数是均值，第三个参数是协方差阵。
    wbeta <- mvrnorm(p, mu, sigma)
    # source的系数
    w <- wbeta[, 1]
    # target的系数向量
    beta <- wbeta[, 2]
    return(list(w = w, beta = beta, wbeta = wbeta, sigma = sigma))
}
# 生成target的设计阵
generate_targetx <- function(p, n) {
    # target data的协方差矩阵
    target_sigma <- matrix(rep(0.1, p * p), nrow = p, byrow = TRUE) +
        diag(0.9, nrow = p)
    # 生成随机数
    x_target <- mvrnorm(n, rep(0, p), target_sigma)
    # 返回设计阵，以及协方差阵
    return(list(x_target = x_target, target_sigma = target_sigma))
}
# 生成target的y
generate_targety <- function(x_target, beta) {
    # 提取target的样本量
    n <- nrow(x_target)
    y_target <- NULL
    for (i in 1:n) {
        # 一个一个地生成概率p
        p <- exp(sum(x_target[i, ] * beta)) / (1 +
            exp(sum(x_target[i, ] * beta)))
        # 一个一个添加随机数y
        y_target <- c(y_target, rbinom(1, 1, p))
    }
    # 返回target的y
    return(list(y_target = y_target))
}
# 生成source的设计阵
generate_sourcex <- function(p, sn) {
    # source data的协方差矩阵
    source_sigma <- matrix(rep(0.2, p * p), nrow = p, byrow = TRUE) +
        diag(0.8, nrow = p)
    x_source <- mvrnorm(sn, rep(0, p), source_sigma)
    return(list(x_source = x_source, source_sigma = source_sigma))
}
# 生成source的y
generate_sourcey <- function(x_source, w) {
    # 提取source的样本量
    n <- nrow(x_source)
    # 一个一个地添加随机数
    y_source <- NULL
    for (i in 1:n) {
        # 一个一个地生成概率
        p <- exp(sum(x_source[i, ] * w)) / (1 +
            exp(sum(x_source[i, ] * w)))
        y_source <- c(y_source, rbinom(1, 1, p))
    }
    return(list(y_source = y_source))
}
# 生成整个data
generate_data <- function(
    p, n, sn, tn,
    rho, alphas, alphat) {
    # 生成target和source的系数
    res1 <- generate_coef(p, rho, alphas, alphat)
    # 提取source的系数
    w <- res1$w
    # 提取target的系数
    beta <- res1$beta
    # 生成多个source的设计阵
    res2 <- generate_sourcex(p, sn)
    # 提取设计阵列表
    x_source <- res2$x_source
    # 生成多个source的y
    res3 <- generate_sourcey(x_source, w)
    # 提取source的y列表
    y_source <- res3$y_source
    # 生成target的设计阵
    res4 <- generate_targetx(p, n)
    # 提取设计阵
    x_target <- res4$x_target
    # 生成target的y
    res5 <- generate_targety(x_target, beta)
    # 提取target的y
    y_target <- res5$y_target
    # 生成test的设计阵
    res6 <- generate_targetx(p, tn)
    # 提取设计阵
    x_test <- res6$x_target
    # 生成test的y
    res7 <- generate_targety(x_test, beta)
    # 提取test的y
    y_test <- res7$y_target
    # 合并为数据框
    source <- cbind(x_source, y_source)
    target <- cbind(x_target, y_target)
    test <- cbind(x_test, y_test)
    # 将source，target，test 数据按行拼接为一个大的数据框
    data <- rbind(source, target, test)
    return(data)
}
# 求解angle
solve_angle_beta <- function(x, y, beta0, hatw, lambda, eta) {
    # x 是target data的X，矩阵
    # y 是target data的y，矩阵
    # beta0是估计的初始值
    n <- nrow(x)
    # 目标函数
    f <- function(beta) {
        probability <- exp(x %*% beta) / (1 + exp(x %*% beta))
        func <- -mean(y * log(probability) + (1 - y) * log(1 - probability)) +
            lambda * sum((beta - hatw)^2) - 2 * eta * sum(hatw * beta)
        return(func)
    }
    # 梯度函数
    gradient <- function(beta) {
        hypothesis <- x %*% beta # 矩阵相乘
        probability <- exp(hypothesis) / (1 + exp(hypothesis))
        loss <- probability - y
        func <- t(x) %*% loss / n + 2 * lambda * (beta - hatw) - 2 * eta * hatw
        return(func)
    }
    # 最优化求解
    res <- optim(
        beta0, f, gradient,
        method = "BFGS", control = list(maxit = 30000)
    )
    if (res$convergence == 0) {
        beta_est <- res$par
    } else {
        return("迭代失败")
    }
    return(beta_est)
}
# 求解source
solve_source_beta <- function(x, y) {
    # x 是source data的X，矩阵
    # y 是source data的y，矩阵
    # 将x,y合并为dataframe
    dataf <- data.frame(cbind(x, y))
    # 获取列数
    col_num <- ncol(dataf)
    # 修改列名
    names(dataf)[col_num] <- "y"
    res <- glm(y ~ . - 1, data = dataf, family = binomial)
    beta_est <- res$coefficients
    return(beta_est)
}
# 测试集的表现
test_performance <- function(hatbeta, x, y) {
    # hatbeta是估计的target系数
    # x是test data的X，矩阵
    # y是test data的y，矩阵
    # 计算概率，得到的结果是一个矩阵
    probability <- exp(x %*% hatbeta) / (1 + exp(x %*% hatbeta))
    # 对该结果向量化
    probability <- as.vector(probability)
    # 预测
    y_pred <- ifelse(probability > 0.5, 1, 0)
    # 计算预测的正确率
    corrate <- sum(y_pred == y) / length(y)
    return(corrate)
}
# K 折交叉验证的代码
kfold_cv <- function(lambda, eta, data, p, n, sn, tn, nfolds) {
    # 获取mse_cv的一些参数
    target_x <- data[(sn + 1):(sn + n), 1:p]
    target_y <- data[(sn + 1):(sn + n), 1 + p]
    source_x <- data[1:sn, 1:p]
    source_y <- data[1:sn, p + 1]
    # nfolds 表示几折交叉验证
    fold <- sample(1:nfolds, nrow(target_x), replace = TRUE)
    # 计算每一折下的 mse
    corrate <- sapply(
        1:nfolds,
        mse_cv, # 计算每一个折下的 mse 的函数
        target_x, # 这个以及后面的参数是mse_cv函数中的参数
        target_y,
        source_x,
        source_y,
        lambda,
        eta,
        fold
    )
    result <- list(
        corrate = corrate, # 每一折的corrate
        mean_corrate = mean(corrate), # 所有的corrate的均值
        sd_corrate = sd(corrate) # corrate的标准差
    )
    return(result)
}
# 计算每一折下的 MSE
mse_cv <- function(
    k, target_x, target_y, source_x,
    source_y, lambda, eta, fold) {
    trg_idx <- !fold %in% c(k)
    test_idx <- fold %in% c(k)
    # 提取trainX的列数
    p <- ncol(target_x)
    # 提取训练集的X
    train_x <- target_x[trg_idx, 1:p]
    # 提取训练集的y
    train_y <- target_y[trg_idx]
    # 提取测试集的X
    test_x <- target_x[test_idx, 1:p]
    # 提取测试集的y
    test_y <- target_y[test_idx]
    # 求解source系数
    hatw <- solve_source_beta(source_x, source_y)
    # 求解target系数
    hatbeta <- solve_angle_beta(
        train_x,
        train_y,
        rep(0, p),
        hatw,
        lambda,
        eta
    )
    # 获取测试集上的表现
    corrate <- test_performance(hatbeta, test_x, test_y)
    return(corrate)
}
# 数据生成中的一些参数设置
rhos <- 0.3
alphat <- 1
alphas <- 1
p <- 50
n <- 50
sn <- 5000
tn <- 200
# 生成数据
data <- generate_data(
    p, n, sn, tn, rhos, alphas, alphat
)
map_method <- function(lambda, eta, data, p, n, sn, tn) {
    # 对lambda和eta进行合并
    lambdas <- rep(lambda, each = length(eta))
    etas <- rep(eta, times = length(lambda))
    start_time <- Sys.time()
    # 为每一列求均值
    purrr::map2(lambdas, etas, kfold_cv, data, p, n, sn, tn, nfolds = 5)
    end_time <- Sys.time()
    print("map方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
for_method <- function(lambda, eta, data, p, n, sn, tn) {
    start_time <- Sys.time()
    row <- length(lambda)
    col <- length(eta)
    for (i in 1:row) {
        for (j in 1:col) {
            kfold_cv(lambda[i], eta[j], data, p, n, sn, tn, nfolds = 5)
        }
    }
    end_time <- Sys.time()
    print("for循环方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
lambda_length <- 5
eta_length <- 5
# 超参数
lambda <- seq(0.01, 1, length.out = lambda_length)
eta <- seq(0.1, 10, length.out = eta_length)
print("-----------lambda_length=eta_length=5-----------")
res1 <- map_method(lambda, eta, data, p, n, sn, tn)
res2 <- for_method(lambda, eta, data, p, n, sn, tn)

lambda_length <- 10
eta_length <- 10
# 超参数
lambda <- seq(0.01, 1, length.out = lambda_length)
eta <- seq(0.1, 10, length.out = eta_length)
print("-----------lambda_length=eta_length=10-----------")
res1 <- map_method(lambda, eta, data, p, n, sn, tn)
res2 <- for_method(lambda, eta, data, p, n, sn, tn)

lambda_length <- 15
eta_length <- 15
# 超参数
lambda <- seq(0.01, 1, length.out = lambda_length)
eta <- seq(0.1, 10, length.out = eta_length)
print("-----------lambda_length=eta_length=15-----------")
res1 <- map_method(lambda, eta, data, p, n, sn, tn)
res2 <- for_method(lambda, eta, data, p, n, sn, tn)

lambda_length <- 20
eta_length <- 20
# 超参数
lambda <- seq(0.01, 1, length.out = lambda_length)
eta <- seq(0.1, 10, length.out = eta_length)
print("-----------lambda_length=eta_length=20-----------")
res1 <- map_method(lambda, eta, data, p, n, sn, tn)
res2 <- for_method(lambda, eta, data, p, n, sn, tn)

lambda_length <- 30
eta_length <- 30
# 超参数
lambda <- seq(0.01, 1, length.out = lambda_length)
eta <- seq(0.1, 10, length.out = eta_length)
print("-----------lambda_length=eta_length=30-----------")
res1 <- map_method(lambda, eta, data, p, n, sn, tn)
res2 <- for_method(lambda, eta, data, p, n, sn, tn)
# 保存工作空间
save.image("R7.RData")
