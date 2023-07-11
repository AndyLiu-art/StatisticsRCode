# 加载分类回归训练集包
library("caret")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap35\\sourcecode")
# 读取数据
dataf <- read.csv("boston-housing-logistic.csv")
# 将class列转为因子
dataf$CLASS <- factor(dataf$CLASS, level = c(0, 1))
# 划分数据集
set.seed(10)
train_idx <- caret::createDataPartition(
    dataf$CLASS, # 划分变量
    p = 0.7, # 训练集比例
    list = FALSE
)
# 建立logistic模型
mod <- glm(
    CLASS ~ ., # 公式
    family = binomial, # 二项分布
    data = dataf, # 数据集
    subset = train_idx # 训练集
)
print(summary(mod))
# 预测
prob_pred <- predict(mod, newdata = dataf[-train_idx, ], type = "response")
y_pred <- ifelse(prob_pred > 0.5, 1, 0)
# 创建混淆矩阵
tab <- table(
    dataf[-train_idx, ]$CLASS,
    y_pred,
    dnn = c("Actual", "Predicted")
)
print(tab)
# 保存工作空间
save.image("R13.RData")
