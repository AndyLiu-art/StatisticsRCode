# 加载带有惩罚项的广义线性模型
library("glmnet")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap44\\sourcecode")
# 加载数据集
data(QuickStartExample)
# X矩阵形式
x <- QuickStartExample$x
# Y矩阵形式
y <- QuickStartExample$y
# 构建lasso线性回归，默认
res <- glmnet::glmnet(x, y)
print(res)
# 保存工作空间
save.image("R1.RData")
