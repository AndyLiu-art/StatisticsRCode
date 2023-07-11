# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 二维列联表矩阵形式
compare <- matrix(
    c(60, 32, 3, 11), # 数据
    nrow = 2, # 行数
    dimnames = list(
        c("cancer", "normal"),
        c("smoke", "Not smoke")
    ) # 行列名
)
res <- fisher.test(compare, alternative = "greater")
print(res)
# 保存工作空间
save.image("R12.RData")
