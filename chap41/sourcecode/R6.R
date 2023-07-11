# 加载purrr
library("purrr")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap41\\sourcecode")
map_method <- function(lengths) {
    start_time <- Sys.time()
    mus <- seq(-10, 10, length.out = lengths)
    sigma <- seq(1, 10, length.out = lengths)
    # 为每一列求均值
    purrr::map2(mus, sigma, rnorm, n = 1000)
    end_time <- Sys.time()
    print("map方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
for_method <- function(lengths) {
    start_time <- Sys.time()
    mus <- seq(-10, 10, length.out = lengths)
    sigma <- seq(1, 10, length.out = lengths)
    for (i in 1:lengths) {
        rnorm(n = 1000, mus[i], sigma[i])
    }
    end_time <- Sys.time()
    print("for循环方法所消耗的时间")
    print(end_time - start_time)
    return(NULL)
}
lengths <- 10
print("--------------------------lengths=10---------------------------")
res1 <- map_method(lengths)
res2 <- for_method(lengths)

lengths <- 100
print("--------------------------lengths=100---------------------------")
res1 <- map_method(lengths)
res2 <- for_method(lengths)

lengths <- 1000
print("--------------------------lengths=1000---------------------------")
res1 <- map_method(lengths)
res2 <- for_method(lengths)

lengths <- 10000
print("--------------------------lengths=10000---------------------------")
res1 <- map_method(lengths)
res2 <- for_method(lengths)

lengths <- 100000
print("--------------------------lengths=100000---------------------------")
res1 <- map_method(lengths)
res2 <- for_method(lengths)
# 保存工作空间
save.image("R6.RData")
