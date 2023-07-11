# 加载非线性规划包
library("nloptr")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap34\\sourcecode")
# 定义目标函数，默认是最小化，因此最大化目标函数添加负号
fobj <- function(x) {
    return(
        list(
            "objective" = -(30 * x[1] + 450 * x[2]),
            "gradient" = c(-30, -450)
        )
    )
}
# 不等式限制条件，小于等于
ineqconstraints <- function(x) {
    return(
        list(
            "constraints" = c(
                0.5 * x[1] + 2 * x[2] + 0.25 * x[2]^2 - 800
            ),
            "jacobian" = rbind(
                c(0.5, 2 + 0.5 * x[2])
            )
        )
    )
}
# 初始值
x0 <- rep(0, 2)
# 非线性规划求解
res <- nloptr(
    x0 = x0, # 初始值
    eval_f = fobj, # 目标函数
    lb = c(0, 0), # 变量下界
    ub = c(Inf, Inf), # 变量上界
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
print("最优解为：")
print(x)
print("最优值为：")
print(f)
print("原问题的最优值为：")
print(-f)
# 保存工作空间
save.image("R1.RData")
