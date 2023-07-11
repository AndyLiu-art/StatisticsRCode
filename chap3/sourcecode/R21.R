# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 样本
data <- c(
    206, 223, 235, 264, 229, 217, 188, 204,
    182, 230, 223, 227, 242, 238, 207, 208
)
# Cox-Staut趋势检验
cox_staut_test <- function(x, alternative = "two.sided") {
    # 样本量
    n <- length(x)
    # 计算游程的个数
    if (n %% 2 == 0) {
        c <- n %/% 2
    } else {
        c <- (n + 1) %/% 2
    }
    xs <- c * 2
    # 大于零的个数
    S2 <- sum(x[1:c] - x[(1 + c):xs] > 0)
    # 小于零的个数
    S1 <- sum(x[1:c] - x[(1 + c):xs] < 0)
    # 总个数
    ns <- S1 + S2
    # 二项检验
    if (alternative == "two.sided") {
        statistic_k <- min(S2, S1)
        pvalue <- 2 * pbinom(statistic_k, ns, 0.5)
    } else if (alternative == "less") {
        statistic_k <- S2
        pvalue <- pbinom(statistic_k, ns, 0.5)
    } else {
        statistic_k <- S1
        pvalue <- pbinom(statistic_k, ns, 0.5)
    }
    Method <- "Cox-Staut趋势性检验"
    Dname <- deparse(substitute(x))
    names(statistic_k) <- "Exact binomal test statistic k"
    parameter <- ns
    names(parameter) <- "p=0.5 n"
    # 构造htest标准输出
    structure(
        list(
            statistic = statistic_k,
            parameter = parameter,
            p.value = pvalue,
            method = Method,
            data.name = Dname
        ),
        class = "htest"
    )
}
res <- cox_staut_test(data)
print(res)
# 保存工作空间
save.image("R21.RData")
