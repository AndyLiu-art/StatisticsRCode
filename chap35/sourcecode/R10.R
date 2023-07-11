# 加载K最近邻包
library("class")
# 加载分类回归训练集包
library("caret")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap35\\sourcecode")
# 读取数据
dataf <- read.csv("vacation-trip-classification.csv")
# 变量标准化
dataf$income <- scale(dataf$Income)
dataf$fz <- scale(dataf$Family_size)
# 划分数据集
set.seed(10)
train_idx <- caret::createDataPartition(
    dataf$Result, # 划分变量
    p = 0.7, # 训练集比例
    list = FALSE
)
# 建立knn模型
y_pred <- class::knn(
    dataf[train_idx, 4:5], # 训练集的X
    dataf[-train_idx, 4:5], # 测试集的X
    dataf[train_idx, "Result"], # 训练集的Y
    k = 5 # 最近邻的点
)
# 创建混淆矩阵
tab <- table(
    dataf[-train_idx, "Result"],
    y_pred,
    dnn = c("Actual", "Predicted")
)
print(tab)
# 保存工作空间
save.image("R10.RData")
