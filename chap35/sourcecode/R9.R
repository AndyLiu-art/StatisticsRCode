# 加载随机森林包
library("e1071")
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
# 建立朴素贝叶斯模型
mod <- e1071::naiveBayes(
    class ~ ., # 公式
    data = dataf,
    subset = train_idx
)
# 预测
y_pred <- predict(
    mod, # 模型
    newdata = dataf[-train_idx, ], # 测试集，不需要剔除y
    type = "class" # 输出分类结果
)
print(y_pred[1:10])
# 创建混淆矩阵
tab <- table(
    dataf[-train_idx, ]$class,
    y_pred,
    dnn = c("Actual", "Predicted")
)
print(tab)
# 保存工作空间
save.image("R9.RData")
