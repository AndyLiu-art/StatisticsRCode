# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap20\\sourcecode")
# 定义目标函数
fobj <- function(x) {
    res <- x[1]^3 - x[1] * x[2] + x[3]^2
    return(res)
}
# 初始值
x0 <- rep(0, 3)
# 最小值
res <- optim(
    x0, # 初始值
    fobj, # 目标函数
    lower = c(-1, -1, 1), # 变量的下界
    upper = c(1, 1, 2), # 变量的上界
    method = "L-BFGS-B", # 算法
    control = list(maxit = 30000) # 最大迭代次数
)
if (res$convergence == 0) {
    # 最小值点
    x <- res$par
    # 最小值
    f <- res$value
    print("最小值点：")
    print(x)
    print("最小值：")
    print(f)
} else {
    print("迭代过程未收敛")
}
# 保存工作空间
save.image("R4.RData")
