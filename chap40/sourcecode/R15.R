# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap40\\sourcecode")
# 生成matrame数据
generate_data <- function(len) {
    # 生成向量
    vec <- round(runif(len, min = 2, max = 50))
    return(vec)
}
app_method <- function(vec) {
    start_time <- Sys.time()
    # 为每一个元素执行同一个操作
    sapply(vec, sample, size = 10, replace = TRUE)
    end_time <- Sys.time()
    print("apply方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
for_method <- function(vec) {
    start_time <- Sys.time()
    for (i in vec) {
        sample(i, size = 10, replace = TRUE)
    }
    end_time <- Sys.time()
    print("for循环方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
len <- 10
vec <- generate_data(len)
print("-----------------------len=10------------------------")
res1 <- app_method(vec)
res2 <- for_method(vec)

len <- 100
vec <- generate_data(len)
print("-----------------------len=100------------------------")
res1 <- app_method(vec)
res2 <- for_method(vec)

len <- 1000
vec <- generate_data(len)
print("-----------------------len=1000------------------------")
res1 <- app_method(vec)
res2 <- for_method(vec)

len <- 10000
vec <- generate_data(len)
print("-----------------------len=10000------------------------")
res1 <- app_method(vec)
res2 <- for_method(vec)

len <- 100000
vec <- generate_data(len)
print("-----------------------len=100000------------------------")
res1 <- app_method(vec)
res2 <- for_method(vec)
# 保存工作空间
save.image("R15.RData")
