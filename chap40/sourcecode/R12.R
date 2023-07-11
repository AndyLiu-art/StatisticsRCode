# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap40\\sourcecode")
# 生成matrame数据
generate_data <- function(row, col) {
    # 生成矩阵
    mat <- matrix(rnorm(row * col), nrow = row)
    return(mat)
}
app_method <- function(mat) {
    start_time <- Sys.time()
    # 为每一行求均值
    res <- apply(mat, 1, mean)
    end_time <- Sys.time()
    print("apply方法所消耗的时间")
    print(end_time - start_time)
    return(res)
}
for_method <- function(mat) {
    start_time <- Sys.time()
    row <- nrow(mat)
    # 存储结果的向量
    resvec <- numeric(row)
    for (i in 1:row) {
        resvec[i] <- mean(mat[i, ])
    }
    end_time <- Sys.time()
    print("for循环方法所消耗的时间")
    print(end_time - start_time)
    return(resvec)
}
col <- 10
row <- 20
mat <- generate_data(row, col)
print("-----------------------row=20------------------------")
res1 <- app_method(mat)
res2 <- for_method(mat)

col <- 10
row <- 200
mat <- generate_data(row, col)
print("-----------------------row=200------------------------")
res1 <- app_method(mat)
res2 <- for_method(mat)

col <- 10
row <- 2000
mat <- generate_data(row, col)
print("-----------------------row=2000------------------------")
res1 <- app_method(mat)
res2 <- for_method(mat)

col <- 10
row <- 20000
mat <- generate_data(row, col)
print("-----------------------row=20000------------------------")
res1 <- app_method(mat)
res2 <- for_method(mat)

col <- 10
row <- 200000
mat <- generate_data(row, col)
print("-----------------------row=200000------------------------")
res1 <- app_method(mat)
res2 <- for_method(mat)
# 保存工作空间
save.image("R12.RData")
