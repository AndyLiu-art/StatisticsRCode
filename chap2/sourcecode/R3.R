# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap2\\sourcecode")
# 待估计的数据
x <- c(
    12.15, 12.12, 12.01, 12.08, 12.09, 12.16, 12.03, 12.01,
    12.06, 12.13, 12.07, 12.11, 12.08, 12.01, 12.03, 12.06
)
# 单总体方差的置信区间
interval_var <- function(x, mean = NULL, conf_level = 0.95) {
    # 样本量
    n <- length(x)
    if (is.null(mean) == TRUE) {
        # 样本均值
        mean <- mean(x)
        # 方差
        s2 <- var(x)
        # 自由度
        freedom <- n - 1
    } else {
        # 方差
        s2 <- sum((x - mean)^2) / n
        # 自由度
        freedom <- n
    }
    # 下分位点
    x_la <- qchisq(
        (1 - conf_level) / 2, # 分位数
        freedom # 自由度
    )
    # 上分位点
    x_ua <- qchisq(
        (1 + conf_level) / 2, # 分位数
        freedom # 自由度
    )
    # 置信下限
    conf_lower <- freedom * s2 / x_ua
    # 置信上限
    conf_upper <- freedom * s2 / x_la
    # 返回值
    res <- data.frame(
        n = n,
        mean = mean,
        sigma = sqrt(s2),
        freedom = freedom,
        conf_level = conf_level,
        x_la = x_la,
        x_ua = x_ua,
        conf_lower = conf_lower,
        conf_upper = conf_upper,
        distribution = sprintf("chisq(%d)", freedom)
    )
    return(res)
}
res <- interval_var(
    x = x, # 样本
    conf_level = 0.98 # 置信水平
)
print(res)
# 保存工作空间
save.image("R3.RData")
