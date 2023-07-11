# 加载求非线性方程组的包
library("rootSolve")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap25\\sourcecode")
# 定义函数
f <- function(x) {
    res <- c(
        x[1]^2 + x[2]^2 - 1,
        2 * x[1] + 0.5 - x[2]^2
    )
    return(res)
}
# 初始值
p0 <- c(1, 2)
# 解非线性方程组
res <- rootSolve::multiroot(f, p0)
print(res)
print("非线性方程组的解为：")
print(res$root)
# 保存工作空间
save.image("R2.RData")
