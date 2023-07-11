# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap28\\sourcecode")
# 核密度估计
kernal_density <- function(x, kerfunc, xsample, h, n) {
    # x是输出的核函数函数自变量，xsample是样本点
    res <- sum(kerfunc((x - xsample) / h))
    return(res)
}
# 定义不同的核函数
unifk <- function(x) {
    ifelse(abs(x) <= 1, 1 / 2, 0)
}
epank <- function(x) {
    ifelse(abs(x) <= 1, 0.75 * (1 - x^2), 0)
}
trik <- function(x) {
    ifelse(abs(x) <= 1, 1 - abs(x), 0)
}
quak <- function(x) {
    ifelse(abs(x) <= 1, 15 * (1 - x^2)^2 / 16, 0)
}
sixk <- function(x) {
    ifelse(abs(x) <= 1, 70 * (1 - abs(x)^3)^3 / 81, 0)
}
cosk <- function(x) {
    ifelse(abs(x) <= 1, pi * cos(pi * x / 2) / 4, 0)
}
twk <- function(x) {
    ifelse(abs(x) <= 1, 35 * (1 - x^2)^3 / 32, 0)
}
gaussk <- function(x) {
    dnorm(x)
}
logitk <- function(x) {
    1 / (exp(x) + exp(-x) + 2)
}
sigmoidk <- function(x) {
    2 / (pi * (exp(x) + exp(-x)))
}
# 设置随机数
set.seed(1)
# 设置样本量
samplesize <- 100
# 生成x
x <- rnorm(samplesize)
# 核函数组
kernals <- c(
    unifk, epank, trik, quak, sixk,
    cosk, twk, gaussk, logitk, sigmoidk
)
# 核函数名称
kernalstr <- c(
    "uniform", "epanechnikov", "triangle", "quartic",
    "tricube", "cosinus", "triweight", "gaussian",
    "logistic", "sigmoid"
)
# 生成自变量序列
xdiv <- seq(min(x), max(x), length = 500)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf")
# 不规则子图
mat <- matrix(
    c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10),
    nrow = 4,
    byrow = TRUE
)
layout(mat)
for (i in 1:length(kernalstr)) {
    ydiv <- sapply(
        xdiv, kernal_density,
        kerfunc = kernals[[i]], # 必须是列表索引方式
        xsample = x,
        h = 0.5,
        n = samplesize
    )
    plot(
        xdiv, ydiv,
        type = "l",
        xlab = kernalstr[i], ylab = "density"
    )
}
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R2.RData")
