# 加载purrr
library("purrr")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap41\\sourcecode")
map_method <- function(len) {
    start_time <- Sys.time()
    # 创建数据
    vec <- round(runif(len, 2, 50))
    # 为每一列求均值
    purrr::map(vec, sample, size = 20, replace = TRUE)
    end_time <- Sys.time()
    print("map方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
for_method <- function(len) {
    start_time <- Sys.time()
    # 创建数据
    vec <- round(runif(len, 2, 50))
    for (i in vec) {
        sample(i, size = 20, replace = TRUE)
    }
    end_time <- Sys.time()
    print("for循环方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
len <- 10
print("--------------------------len=10---------------------------")
res1 <- map_method(len)
res2 <- for_method(len)

len <- 100
print("--------------------------len=100---------------------------")
res1 <- map_method(len)
res2 <- for_method(len)

len <- 1000
print("--------------------------len=1000---------------------------")
res1 <- map_method(len)
res2 <- for_method(len)

len <- 10000
print("--------------------------len=10000---------------------------")
res1 <- map_method(len)
res2 <- for_method(len)

len <- 100000
print("--------------------------len=100000---------------------------")
res1 <- map_method(len)
res2 <- for_method(len)
# 保存工作空间
save.image("R1.RData")
