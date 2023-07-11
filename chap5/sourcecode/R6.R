# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
# 线性回归拟合
lmod <- lm(
    mpg ~ disp + hp + drat + wt + qsec, # 默认有截距项
    data = mtcars # 数据集
)
res <- step(
    lmod, # 回归模型
    direction = "both" # 一切子集回归
)
print(res)
print(summary(res))
# 保存工作空间
save.image("R6.RData")
