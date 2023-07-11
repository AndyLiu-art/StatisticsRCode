# 加载lda分类包
library("MASS")
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
# 建立线性判别模型
mod <- MASS::lda(
    class ~ ., # 公式
    data = dataf, # 数据集
    subset = train_idx # 训练集
)
# 预测
y_pred <- predict(mod, newdata = dataf[-train_idx, ])$class
# 创建混淆矩阵
tab <- table(
    dataf[-train_idx, ]$class,
    y_pred,
    dnn = c("Actual", "Predicted")
)
print(tab)
# 保存工作空间
save.image("R12.RData")
