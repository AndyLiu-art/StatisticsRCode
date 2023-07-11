# 加载Bootstrap包
library("bootstrap")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap13\\sourcecode")
# B次重抽样
B <- 2000
# 每次抽样的大小
samplesize <- nrow(law)
mean_compute <- function(d, i) {
    return(mean(d$GPA[i]))
}
rho_compute <- function(d, i) {
    return(cor(d$LSAT[i], d$GPA[i]))
}
res1 <- boot::boot(law, mean_compute, R = B, stype = "i")
res2 <- boot::boot(law, rho_compute, R = B, stype = "i")
# Bootstrap置信区间
conf_res1 <- boot::boot.ci(
    res1, # boot的结果
    conf = 0.95 # 置信水平
)
conf_res2 <- boot::boot.ci(
    res2, # boot的结果
    conf = 0.95 # 置信水平
)
print("Bootstrap估计总体均值的置信区间为：")
print(conf_res1)
print("Bootstrap估计相关系数的置信区间为：")
print(conf_res2)
# 保存工作空间
save.image("R7.RData")
