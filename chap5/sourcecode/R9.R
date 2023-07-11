# 加载筛选变量的包
library("leaps")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
regress_variable_select <- function(x, y) {
    # dataframe自变量x的行数
    n <- nrow(x)
    # dataframe自变量x的列数
    m <- ncol(x)
    # 最大的变量组合数
    maxsize <- choose(m, m %/% 2)
    # 变量选择
    lm_all <- leaps::regsubsets(y ~ ., data = x, nbest = maxsize)
    # 变量选择的结果
    lm_summarize <- summary(lm_all)
    # 获取因子个数
    p <- apply(lm_summarize$which, 1, sum) - 1
    # 前几列的名称
    cname <- c("Intercept", colnames(x)[1:m])
    # 存储结果
    result <- cbind(
        lm_summarize$which,
        lm_summarize$rsq,
        lm_summarize$adjr2,
        lm_summarize$rss,
        lm_summarize$rss / (n - p - 1),
        lm_summarize$cp,
        lm_summarize$bic
    )
    crit <- c("R2", "adjR2", "SSE", "MSE", "CP", "BIC")
    # 为结果result构造列名
    colnames(result) <- c(cname, crit)
    # 为了统一使用which.min
    result[, (m + 2):(m + 3)] <- -result[, (m + 2):(m + 3)]
    # 获取各个准则下的最优模型
    obj <- apply(result[, (m + 2):ncol(result)], 2, which.min)
    # 为obj重命名
    names(obj) <- paste(crit, c("max", "max", rep("min", 4)), sep = "_")
    # 恢复前两列数据
    result[, (m + 2):(m + 3)] <- -result[, (m + 2):(m + 3)]
    return(
        list(
            variableselect = result,
            best.row = obj,
            best.value = diag(result[obj, (m+2):ncol(result)])
        )
    )
}
res <- regress_variable_select(
    mtcars[, c("disp", "hp", "drat", "wt", "qsec")],
    mtcars$mpg
)
print(res)
# 保存工作空间
save.image("R9.RData")
