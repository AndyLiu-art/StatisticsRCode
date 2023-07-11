# 加载虚拟变量生成的包
library("caret")
# 加载回归树模型
library("rpart")
library("rpart.plot")
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
# 建立回归树模型
mod <- rpart::rpart(MEDV ~ ., data = trg)
print(mod)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
# 绘制树状图
rpart.plot::prp(
    mod,
    type = 2, nn = TRUE, fallen.leaves = TRUE,
    faclen = 4, varlen = 8, shadow.col = "gray"
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 查看cptable
print(mod$cptable)
# 绘制cp图
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf")
# 绘制cp图
rpart::plotcp(mod)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 选择最好的cp值进行剪枝
modpruned <- rpart::prune(mod, cp = 0.037)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code3.pdf")
# 绘制树状图
rpart.plot::prp(
    modpruned,
    type = 2, nn = TRUE, fallen.leaves = TRUE,
    faclen = 4, varlen = 8, shadow.col = "gray"
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 预测值
y_pred <- predict(modpruned, newdata = test)
# MSE
mse <- mean((y_pred - test$MEDV)^2)
print("测试集上的均方误差：")
print(mse)
# 保存工作空间
save.image("R2.RData")
