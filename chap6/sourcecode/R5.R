# 加载Fisher线性判别分析的包
library("MASS")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap6\\sourcecode")
# 建立Fisher线性判别分析模型
mod <- MASS::lda(
    Species ~ ., # 公式
    prior = c(0.4, 0.4, 0.2), # 先验概率相等
    data = iris # 数据
)
print(mod)
# 训练集上预测
res <- predict(mod)
print(res)
# 训练集上的预测准确率，混淆矩阵
tab <- table(iris$Species, res$class)
print(tab)
# 训练集上的预测准确率
print(sum(diag(prop.table(tab))))
# 保存工作空间
save.image("R5.RData")
