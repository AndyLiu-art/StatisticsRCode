# 加载非线性规划包
library("nloptr")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap34\\sourcecode")
# 定义目标函数，默认是最小化，因此最大化目标函数添加负号
fobj <- function(x) {
    return(list(
        "objective" = -x[1]^2 - x[2]^2 - x[3]^2 - 8,
        "gradient" = c(-2 * x[1], -2 * x[2], -2 * x[3])
    ))
}
# 不等式限制条件，小于等于
ineqconstraints <- function(x) {
    return(
        list(
            "constraints" = c(
                -x[1]^2 + x[2] - x[3]^2,
                x[1] + x[2]^2 + x[3]^2 - 20
            ),
            "jacobian" = rbind(
                c(-2 * x[1], 1, -2 * x[3]),
                c(1, 2 * x[2], 2 * x[3])
            )
        )
    )
}
# 等式限制条件
eqconstraints <- function(x) {
    return(
        list(
            "constraints" = c(
                -x[1] - x[2]^2 + 2,
                x[2] + 2 * x[3]^2 - 3
            ),
            "jacobian" = rbind(
                c(-1, -2 * x[2], 0),
                c(0, 1, 2 * x[3])
            )
        )
    )
}
# 初始值，最好不要取相同的值
x0 <- c(1, 3, 2)
# 非线性规划求解
res <- nloptr(
    x0 = x0, # 初始值
    eval_f = fobj, # 目标函数
    lb = c(0, 0, 0), # 变量下界
    ub = c(Inf, Inf, Inf), # 变量上界
    eval_g_ineq = ineqconstraints, # 不等式约束
    eval_g_eq = eqconstraints, # 等式约束
    opts = list(
        "algorithm" = "NLOPT_LD_SLSQP", # 算法
        "xtol_rel" = 1.0e-8 # 精度
    )
)
# 最优解
x <- res$solution
# 最优值
f <- res$objective
print("最优解为：")
print(x)
print("最优值为：")
print(f)
print("原问题的最优值为：")
print(-f)
# 保存工作空间
save.image("R2.RData")
