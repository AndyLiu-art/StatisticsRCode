# 加载数据集划分的包
library("caret")
# 加载神经网络
library("nnet")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap38\\sourcecode")
# 读取数据
dataf <- read.csv("BostonHousing.csv")
# 划分数据集
set.seed(10)
idx <- caret::createDataPartition(dataf$MEDV, p = 0.7, list = FALSE)
# 训练集
trg <- dataf[idx, ]
# 测试集
test <- dataf[-idx, ]
# K折交叉验证的代码
kfold_CV <- function(df, nfolds) {
    # df表示数据框
    # nfolds表示几折交叉验证
    fold <- sample(1:nfolds, nrow(df), replace = TRUE)
    # 计算每一折下的mse
    mse <- sapply(
        1:nfolds,
        mse_CV, # 计算每一个折下的mse的函数
        df,
        fold
    )
    result <- list(
        mse = mse, # 每一折的mse
        overall_mse = mean(mse), # 所有的mse的均值
        overall_stdmse = sd(mse) # mse的标准差
    )
    return(result)
}
# 计算每一折下的MSE
mse_CV <- function(k, df, fold) {
    trg_idx <- !fold %in% c(k)
    test_idx <- fold %in% c(k)
    # 建立模型
    mod <- mod <- nnet::nnet(
        MEDV / 50 ~ .,
        data = df[trg_idx, ], size = 6,
        decay = 0.1, maxit = 1000, linout = TRUE
    )
    # 预测值
    y_pred <- predict(mod, newdata = df[test_idx, ])
    # 真实值
    y_true <- df[test_idx, "MEDV"]
    # mse
    mse <- mean((y_true / 50 - y_pred)^2)
    return(mse)
}
# 五折交叉验证
res <- kfold_CV(trg, 5)
print(res)
# 保存工作空间
save.image("R5.RData")
