# 加载神经网络包
library("nnet")
# 加载分类回归训练集包
library("caret")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap35\\sourcecode")
# 读取数据
dataf <- read.csv("banknote-authentication.csv")
# 将class列转为因子
dataf$class <- factor(dataf$class)
# 划分数据集
set.seed(10)
train_idx <- caret::createDataPartition(
    dataf$class, # 划分变量
    p = 0.7, # 训练集比例
    list = FALSE
)
# 建立神经网络模型
mod <- nnet::nnet(
    class ~ ., # 公式
    data = dataf, # 数据集
    subset = train_idx, # 训练集
    size = 3, # 隐藏层的个数
    maxit = 1000, # 最大迭代次数
    decay = 0.001, # 控制过度拟合
    rang = 0.05 # 初始权重范围
)
# 预测
y_pred <- predict(mod, newdata = dataf[-train_idx, ], type = "class")
# 原始概率
prob_pred <- predict(mod, newdata = dataf[-train_idx, ], type = "raw")
# 创建混淆矩阵
tab <- table(
    dataf[-train_idx, ]$class,
    y_pred,
    dnn = c("Actual", "Predicted")
)
print(tab)
# 保存工作空间
save.image("R11.RData")
