# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap20\\sourcecode")
# 加载生成多元正态分布随机数的包
library("MASS")
# 加载非线性规划包
library("nloptr")
# 随机数种子
set.seed(1)
# 生成y
y <- rnorm(n = 50)
# 随机数种子
set.seed(2)
# 生成X
X <- mvrnorm(
    n = 50, # 样本量
    rep(0, 100), # 均值向量
    diag(100) # 协方差阵
)

# 定义目标函数，默认是最小化
fobj <- function(beta) {
    return(
        list(
            "objective" = sum((y - X %*% beta)^2),
            "gradient" = -2 * t(X) %*% (y - X %*% beta)
        )
    )
}
# 不等式限制条件，小于等于
ineqconstraints <- function(beta) {
    return(
        list(
            "constraints" = sum(beta^2) - 1,
            "jacobian" = 2 * beta
        )
    )
}
# 初始值
x0 <- rep(0, 100)
# 非线性规划求解
res <- nloptr(
    x0 = x0, # 初始值
    eval_f = fobj, # 目标函数
    eval_g_ineq = ineqconstraints, # 不等式约束
    opts = list(
        "algorithm" = "NLOPT_LD_MMA", # 算法
        "xtol_rel" = 1.0e-8 # 精度
    )
)
# 最优解
x <- res$solution
# 最优值
f <- res$objective
print("最优解(部分)为：")
print(x[seq(1, 100, by = 10)])
print("最优值为：")
print(f)
# 保存工作空间
save.image("R5.RData")
