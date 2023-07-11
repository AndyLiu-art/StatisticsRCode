# 加载purrr
library("parallel")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap42\\sourcecode")
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
# 求解source
solve_source_beta <- function(dataf) {
    # x 是source data的X，矩阵
    # y 是source data的y，矩阵
    dataf <- as.data.frame(dataf)
    # 获取列数
    col_num <- ncol(dataf)
    # 修改列名
    names(dataf)[col_num] <- "y"
    res <- glm(y ~ . - 1, data = dataf, family = binomial)
    beta_est <- res$coefficients
    return(beta_est)
}
# 数据生成中的一些参数设置
rhos <- 0.3
alphat <- 1
alphas <- 1
p <- 50
n <- 50
sn <- 5000
tn <- 200
lambda <- 0.2
eta <- 0.5
parallel_method <- function(dataf) {
    start_time <- Sys.time()
    # 计算CPU的内核数
    clnum <- detectCores()
    # 开启并行计算
    cl <- makeCluster(getOption("cl.cores", clnum))
    # 为每一行求均值
    res <- parLapply(cl, dataf, solve_source_beta)
    # 关闭并行计算
    stopCluster(cl)
    end_time <- Sys.time()
    print("apply方法所消耗的时间")
    print(end_time - start_time)
    return(res)
}
for_method <- function(dataf) {
    start_time <- Sys.time()
    len <- length(dataf)
    # 存储结果的向量
    resvec <- list()
    for (i in 1:len) {
        resvec[[i]] <- solve_source_beta(dataf[[i]])
    }
    end_time <- Sys.time()
    print("for循环方法所消耗的时间")
    print(end_time - start_time)
    return(resvec)
}
simulation_time <- 10
dataf <- list()
for (i in 1:simulation_time){
    dataf[[i]] <- generate_data(
        p, n, sn, tn, rhos, alphas, alphat
    )
}
print("-----------------------simulation_time=10------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)

simulation_time <- 50
dataf <- list()
for (i in 1:simulation_time){
    dataf[[i]] <- generate_data(
        p, n, sn, tn, rhos, alphas, alphat
    )
}
print("-----------------------simulation_time=50------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)

simulation_time <- 100
dataf <- list()
for (i in 1:simulation_time){
    dataf[[i]] <- generate_data(
        p, n, sn, tn, rhos, alphas, alphat
    )
}
print("-----------------------simulation_time=100------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)

simulation_time <- 200
dataf <- list()
for (i in 1:simulation_time){
    dataf[[i]] <- generate_data(
        p, n, sn, tn, rhos, alphas, alphat
    )
}
print("-----------------------simulation_time=500------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)
# 保存工作空间
save.image("R10.RData")
