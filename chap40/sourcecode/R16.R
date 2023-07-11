# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap40\\sourcecode")
app_method <- function(len, row, col) {
    start_time <- Sys.time()
    # 为每一个元素执行同一个操作
    datalst <- list()
    for (i in 1:len) {
        datalst[[i]] <- matrix(rnorm(row * col), nrow = row)
    }
    lapply(datalst, det)
    end_time <- Sys.time()
    print("apply方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
for_method <- function(len, row, col) {
    start_time <- Sys.time()
    for (i in 1:len) {
        det(matrix(rnorm(row * col), nrow = row))
    }
    end_time <- Sys.time()
    print("for循环方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
row <- 200
col <- 200
len <- 10
print("-----------------------len=10------------------------")
res1 <- app_method(len, row, col)
res2 <- for_method(len, row, col)

len <- 100
print("-----------------------len=100------------------------")
res1 <- app_method(len, row, col)
res2 <- for_method(len, row, col)

len <- 1000
print("-----------------------len=1000------------------------")
res1 <- app_method(len, row, col)
res2 <- for_method(len, row, col)

len <- 10000
print("-----------------------len=10000------------------------")
res1 <- app_method(len, row, col)
res2 <- for_method(len, row, col)
# 保存工作空间
save.image("R16.RData")
