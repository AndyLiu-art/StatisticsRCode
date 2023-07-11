# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap40\\sourcecode")
# 生成matrame数据
generate_data <- function(row, col) {
    # 生成矩阵
    mat <- matrix(round(runif(row * col, min = 2, max = 50)), nrow = row)
    return(mat)
}
app_method <- function(mat) {
    start_time <- Sys.time()
    # 为每一个元素执行同一个操作
    apply(mat, 1:2, sample, size = 10, replace = TRUE)
    end_time <- Sys.time()
    print("apply方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
for_method <- function(mat) {
    start_time <- Sys.time()
    row <- nrow(mat)
    col <- ncol(mat)
    for (i in 1:row) {
        for (j in 1:col) {
            sample(mat[i, j], size = 10, replace = TRUE)
        }
    }
    end_time <- Sys.time()
    print("for循环方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
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
save.image("R13.RData")
