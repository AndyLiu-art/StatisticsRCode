# 加载并行计算包
library("doParallel")
library("parallel")
library("foreach")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap43\\sourcecode")
# 生成dataframe数据
generate_data <- function(row, col) {
    # 生成矩阵
    mat <- matrix(rnorm(row * col), nrow = row)
    # 转为dataframe
    dataf <- as.data.frame(mat)
    return(dataf)
}
parallel_method <- function(dataf) {
    start_time <- Sys.time()
    # 计算CPU的内核数
    clnum <- detectCores()
    # 开启并行计算
    cl <- makeCluster(getOption("cl.cores", clnum))
    # 注册进程
    doParallel::registerDoParallel(cl)
    # 列数
    col <- dim(dataf)[2]
    # 为每一列求均值
    res <- foreach(i = 1:col, .combine = cbind) %dopar% mean(dataf[, i])
    # 关闭并行计算
    stopCluster(cl)
    end_time <- Sys.time()
    print("apply方法所消耗的时间")
    print(end_time - start_time)
    return(res)
}
for_method <- function(dataf) {
    start_time <- Sys.time()
    col <- ncol(dataf)
    # 存储结果的向量
    resvec <- numeric(col)
    for (i in 1:col) {
        resvec[i] <- mean(dataf[, i])
    }
    end_time <- Sys.time()
    print("for循环方法所消耗的时间")
    print(end_time - start_time)
    return(resvec)
}
col <- 10
row <- 20
dataf <- generate_data(row, col)
print("-----------------------row=20------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)

col <- 10
row <- 200
dataf <- generate_data(row, col)
print("-----------------------row=200------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)

col <- 10
row <- 2000
dataf <- generate_data(row, col)
print("-----------------------row=2000------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)

col <- 10
row <- 20000
dataf <- generate_data(row, col)
print("-----------------------row=20000------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)

col <- 10
row <- 200000
dataf <- generate_data(row, col)
print("-----------------------row=200000------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)
# 保存工作空间
save.image("R2.RData")
