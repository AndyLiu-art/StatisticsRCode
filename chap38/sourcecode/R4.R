# 加载虚拟变量生成的包
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
# 建立神经网络回归模型
mod <- nnet::nnet(
    MEDV / 50 ~ .,
    data = trg, size = 6,
    decay = 0.1, maxit = 1000, linout = TRUE
)
print(mod)
print(summary(mod))
# 预测值
y_pred <- predict(mod, test)
mse <- mean((y_pred - test[, "MEDV"] / 50)^2)
print("测试集上的均方误差：")
print(mse)
# 保存工作空间
save.image("R4.RData")
