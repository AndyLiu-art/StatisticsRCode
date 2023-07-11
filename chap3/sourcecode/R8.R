# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 符号检验
sign_test <- function(x, m0, p = 0.5, alpha = 0.05, alternative = "two.sided") {
    # m0是待检验的分位数
    # p是要检验m0是否为p分位数
    # 样本量
    n <- length(x)
    # 符号向量
    sign <- as.numeric(x >= m0)
    # 大于m0的个数
    s <- sum(sign)
    # 二项精确检验的结果
    result <- binom.test(
        s, # 成功的次数
        n, # 实验的总次数
        p = p, # 实验发生的概率
        alternative = alternative, # 备择假设
        conf.level = 1 - alpha # 置信水平
    )
    return(result)
}
# 样本
dataf <- c(
    4632, 4728, 5052, 5064, 5484, 6972, 7696,
    9048, 14760, 15013, 18730, 21240, 22836, 52788, 67200
)
# 待检验的中位数
me <- 6064
res <- sign_test(
    dataf, # 样本
    me # 中位数
)
print(res)
# 保存工作空间
save.image("R8.RData")
