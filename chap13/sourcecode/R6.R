# 加载Bootstrap包
library("bootstrap")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap13\\sourcecode")
# B次重抽样
B <- 2000
# 每次抽样的大小
samplesize <- nrow(law)
# 存储索引的矩阵
indice <- matrix(0, nrow = B, ncol = samplesize)
# 存储结果的向量
rB_lst <- NULL
for (i in 1:B) {
    index <- sample(1:samplesize, size = samplesize, replace = TRUE)
    # 重抽样的样本1
    LSAT <- law$LSAT[index]
    # 重抽样的样本2
    GPA <- law$GPA[index]
    # 计算相关系数
    r <- cor(LSAT, GPA)
    # 存储到向量中
    rB_lst <- c(rB_lst, r)
    # 将索引保存到矩阵的每一行
    indice[i, ] <- index
}
# 存储标准差的向量
se_jack <- NULL
# Jackknife抽样
for (j in 1:samplesize) {
    keep <- (1:B)[apply(
        indice, 1, function(x) {
            !any(x == j)
        }
    )]
    # 计算标准差
    se_jack <- c(se_jack, sd(rB_lst[keep]))
}
# 计算Jackknife标准差
res <- sqrt(var(se_jack) * (samplesize - 1)^2 / samplesize)
print("Bootstrap方法下估计量的标准差为：")
print(sd(rB_lst))
print("Jackknife-after-bootstrap的标准差估计值为：")
print(res)
# 保存工作空间
save.image("R6.RData")
