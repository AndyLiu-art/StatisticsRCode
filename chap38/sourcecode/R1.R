# 加载虚拟变量生成的包
library("caret")
# 加载KNN回归模型
library("FNN")
# 加载scale变量的包
library("scales")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap38\\sourcecode")
# 读取数据
dataf <- read.csv("education.csv")
# 将第一列删除
dataf <- dataf[, -1]
# 转为dataframe，因子型
datafct <- as.data.frame(factor(dataf$region))
# 分类变量虚拟化
res <- caret::dummyVars(~., datafct)
# 生成虚拟变量
dummyvar <- predict(res, datafct)
# 合并为dataframe
dataf <- cbind(dummyvar, dataf)
# 将变量的值缩放到01区间
dataf$urban <- sapply(
    dataf$urban,
    function(x) {
        (x - min(dataf$urban)) / (max(dataf$urban) - min(dataf$urban))
    }
)
dataf$income <- sapply(
    dataf$income,
    function(x) {
        (x - min(dataf$income)) / (max(dataf$income) - min(dataf$income))
    }
)
dataf$under18 <- sapply(
    dataf$under18,
    function(x) {
        (x - min(dataf$under18)) / (max(dataf$under18) - min(dataf$under18))
    }
)
# 划分数据集
set.seed(10)
idx <- caret::createDataPartition(dataf$expense, p = 0.6, list = FALSE)
# 训练集
trg <- dataf[idx, ]
# 测试集
test <- dataf[-idx, ]
# 建立KNN模型
mod <- FNN::knn.reg(
    trg[, -9], test[, -9], trg[, 9],
    k = 1, algorithm = "brute"
)
y_pred <- mod$pred
# 均方误差
mse <- mean((y_pred - test[, 9])^2)
print(mse)
# 保存工作空间
save.image("R1.RData")
