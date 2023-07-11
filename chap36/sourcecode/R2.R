# 加载运输问题求解包
library("lpSolve")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap36\\sourcecode")
# 费用矩阵
cost <- matrix(
    c(
        5, 9, 11, 14, 13,
        8, 10, 15, 13, 11,
        7, 9, 12, 9, 8,
        7, 9, 13, 7, 10,
        6, 8, 12, 10, 8
    ),
    nrow = 5, # 行数
    byrow = TRUE # 按行排列
)
# 指派问题求解
res <- lpSolve::lp.assign(
    cost, # 费用矩阵
    direction = "min" # 最小值
)
print(res)
print(res$solution)
# 保存工作空间
save.image("R2.RData")
