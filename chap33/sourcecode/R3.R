# 加载生存分析包
library("Rglpk")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap33\\sourcecode")
# 价值系数
value_coef <- c(40, 90)
# 约束系数矩阵
A <- matrix(
    c(
        9, 7,
        7, 20
    ), # 数据
    nrow = 2, # 行数
    byrow = TRUE # 按行排列
)
# 约束常系数
b <- c(56, 70)
# 约束种类
direction <- rep("<=", 2)
res <- Rglpk::Rglpk_solve_LP(
    obj = value_coef, # 目标函数的系数
    mat = A, # 约束系数矩阵
    dir = direction, # 约束种类
    rhs = b, # 约束常系数
    max = TRUE, # 最大值
    types = "I" # 整数规划
)
print("目标函数最优解：")
print(res$solution)
print("目标函数最大值：")
print(res$optimum)
# 保存工作空间
save.image("R3.RData")
