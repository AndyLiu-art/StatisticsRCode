# 加载决策树
library("rpart")
library("rpart.plot")
# 加载分类回归训练集包
library("caret")
# 加载ROC曲线的包
library("ROCR")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap35\\sourcecode")
# 读取数据
dataf <- read.csv("banknote-authentication.csv")
# 划分数据集
set.seed(10)
train_idx <- caret::createDataPartition(
    dataf$class, # 划分变量
    p = 0.7, # 训练集比例
    list = FALSE
)
# 构建分类树模型
mod <- rpart::rpart(
    class ~ ., # 公式
    data = dataf, # 数据
    subset = train_idx, # 子集
    method = "class", # 分类
    control = rpart::rpart.control(
        minsplit = 20, # 至少需要20个样本才能划分节点
        cp = 0.01 # 复杂度
    )
)
# 选择xerror小于等于最小的xerror与最小的xstd之和的cp
cp_opt <- mod$cptable[, "xerror"] <= (min(mod$cptable[, "xerror"])
+ min(mod$cptable[, "xstd"]))
# 剪枝，根据CP复杂度
mod_pruned <- rpart::prune(
    mod, # 模型
    mod$cptable[6, "CP"] # 选择合适的CP
)
# 预测
y_pred <- predict(
    mod_pruned, # 模型
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
# 计算概率
prob_pred <- predict(
    mod_pruned, # 模型
    newdata = dataf[-train_idx, ], # 测试集，不需要剔除y
    type = "prob" # 输出概率结果
)
# 创建ROC预测对象
pred <- ROCR::prediction(
    prob_pred[, 2], # 预测为1的概率
    dataf[-train_idx, ]$class # 真实类别
)
# 创建ROC表现对象
perf <- ROCR::performance(pred, "tpr", "fpr")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code5.pdf")
# 马赛克图
mosaicplot(tab)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code6.pdf")
# ROC图
plot(perf)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R6.RData")
