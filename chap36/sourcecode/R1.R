# 加载运输问题求解包
library("lpSolve")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap36\\sourcecode")
# 运输费用矩阵
cost <- matrix(
    c(
        5, 2, 6, 7,
        3, 5, 4, 6,
        4, 5, 2, 3
    ),
    nrow = 3, # 行数
    byrow = TRUE # 按行排列
)
# 行符号，生产量
row_aligns <- rep("=", 3)
# 列符号，需求量
col_aligns <- rep("=", 4)
# 行右边的值，生产量
row_rhs <- c(300, 200, 400)
# 列右边的值，需求量
col_rhs <- c(200, 100, 400, 200)
# 运输问题求解
res <- lpSolve::lp.transport(
    cost, # 运输费用矩阵
    direction = "min", # 最小值
    row.signs = row_aligns, # 生产量符号
    col.signs = col_aligns, # 需求量符号
    row.rhs = row_rhs, # 生产量
    col.rhs = col_rhs # 需求量
)
print(res)
print(res$solution)
# 保存工作空间
save.image("R1.RData")
