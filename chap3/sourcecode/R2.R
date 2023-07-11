# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 待检验的数据
x <- c(42, 65, 75, 78, 59, 71, 57, 68, 54, 55)
# 计算P值
P_value <- function(cdf, x, paramet = numeric(0), side = 0) {
    # side为零表示双边检验，为负表示左边检验，为正表示右边检验。
    # paramet 表示传递给累计分布函数值的参数值
    # x表示检验统计量的样本观测值
    # 参数的个数
    n <- length(paramet)
    # 使用switch计算累积分布函数值
    P <- switch(n + 1,
        cdf(x),
        cdf(x, paramet),
        cdf(x, paramet[1], paramet[2]),
        cdf(x, paramet[1], paramet[2], paramet[3])
    )
    # side小于零，左侧P值
    if (side < 0) {
        P
    } else if (side > 0) { # side大于零，右侧P值
        1 - P
    } else if (P < 1 / 2) { # 若P小于1/2，则取它的两倍
        2 * P
    } else { # 若P大于1/2，则取1-P的两倍
        2 * (1 - P)
    }
    return(P)
}
# 单正态总体方差的检验
var_test <- function(x, sigma2 = 1, mu = Inf, side = 0) {
    # 样本量
    n <- length(x)
    # 是否给定了总体均值
    if (mu < Inf) {
        # 样本方差
        S2 <- sum((x - mu)^2) / n
        # 自由度
        df <- n
    } else {
        # 样本方差
        S2 <- var(x)
        # 自由度
        df <- n - 1
    }
    # 检验统计量
    chi2 <- df * S2 / sigma2
    # 计算P值
    P <- P_value(pchisq, chi2, paramet = df, side = side)
    # 返回结果
    res <- data.frame(
        var = S2,
        df = df,
        chisq2 = chi2,
        P_value = P
    )
    return(res)
}
res <- var_test(
    x = x, # 样本
    sigma2 = 80, # 要检验的总体方差
    side = -1 # 左边检验
)
print(res)
# 保存工作空间
save.image("R2.RData")
