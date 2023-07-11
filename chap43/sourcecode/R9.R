# 加载并行计算包
library("doParallel")
library("parallel")
library("foreach")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap43\\sourcecode")
# 生成dataframe数据
generate_data <- function(len) {
    # 生成矩阵
    dataf <- round(runif(len))
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
    # 个数
    len <- length(dataf)
    # 为每一行求均值
    res <- foreach(i = 1:len, .combine = cbind) %dopar% sample(
        i, size=20, replace=TRUE
    )
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
    resvec <- numeric(len)
    for (i in 1:len) {
        resvec[i] <- sample(dataf[i], size=20, replace=TRUE)
    }
    end_time <- Sys.time()
    print("for循环方法所消耗的时间")
    print(end_time - start_time)
    return(resvec)
}
len <- 10
dataf <- generate_data(len)
print("-----------------------len=10------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)

len <- 100
dataf <- generate_data(len)
print("-----------------------len=100------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)

len <- 1000
dataf <- generate_data(len)
print("-----------------------len=1000------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)

len <- 10000
dataf <- generate_data(len)
print("-----------------------len=10000------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)

len <- 100000
dataf <- generate_data(len)
print("-----------------------len=100000------------------------")
res1 <- parallel_method(dataf)
res2 <- for_method(dataf)
# 保存工作空间
save.image("R9.RData")
