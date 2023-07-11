# 加载purrr
library("purrr")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap41\\sourcecode")
# 创建数据
generate_data <- function(row, col) {
    dataf <- matrix(rnorm(row * col), nrow = row)
    return(dataf)
}
map_method <- function(dataf) {
    start_time <- Sys.time()
    # 为每一列求均值
    purrr::map(dataf, mean)
    end_time <- Sys.time()
    print("map方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
for_method <- function(dataf) {
    start_time <- Sys.time()
    col <- ncol(dataf)
    for (i in 1:col) {
        mean(dataf[, i])
    }
    end_time <- Sys.time()
    print("for循环方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
row <- 10
col <- 10
dataf <- generate_data(row, col)
print("--------------------------row=10---------------------------")
res1 <- map_method(dataf)
res2 <- for_method(dataf)

row <- 100
col <- 10
dataf <- generate_data(row, col)
print("--------------------------row=100---------------------------")
res1 <- map_method(dataf)
res2 <- for_method(dataf)

row <- 1000
col <- 10
dataf <- generate_data(row, col)
print("--------------------------row=1000---------------------------")
res1 <- map_method(dataf)
res2 <- for_method(dataf)

row <- 10000
col <- 10
dataf <- generate_data(row, col)
print("--------------------------row=10000---------------------------")
res1 <- map_method(dataf)
res2 <- for_method(dataf)

row <- 100000
col <- 10
dataf <- generate_data(row, col)
print("--------------------------row=100000---------------------------")
res1 <- map_method(dataf)
res2 <- for_method(dataf)
# 保存工作空间
save.image("R5.RData")
