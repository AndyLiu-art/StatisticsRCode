# 加载虚拟变量生成的包
library("caret")
# 加载随机森林回归模型
library("randomForest")
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
# 建立随机森林回归模型
mod <- randomForest::randomForest(
    x = trg[, 1:13], y = trg[, 14], ntree = 100,
    xtest = test[, 1:13], ytest = test[, 14],
    importance = TRUE, keep.forest = TRUE
)
# 检查变量的重要性
print(mod$importance)
# 测试集上的mse
mse <- mod$test$mse
print("测试集上的MSE为：")
print(mse)
# 预测值
y_pred <- mod$test$predicted
# 拟合值
y_fit <- mod$predicted
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code4.pdf")
plot(trg[, 14], y_fit, xlab = "Actual", ylab = "Fitted")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code5.pdf")
plot(test[, 14], y_pred, xlab = "Actual", ylab = "Predicted")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R3.RData")
