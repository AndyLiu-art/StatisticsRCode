# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 二维列联表
compare <- matrix(
    c(64, 21, 4, 12), # 数据
    nrow = 2, # 行数
    byrow = TRUE # 按行排列
)
res <- mcnemar.test(
    compare, # 样本
    correct = FALSE # 不作修正
)
print(res)
# 保存工作空间
save.image("R15.RData")
