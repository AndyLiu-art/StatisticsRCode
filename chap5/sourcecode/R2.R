# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
# 样本
x <- c(318, 910, 200, 409, 425, 502, 314, 1210, 1022, 1225)
y <- c(524, 1019, 638, 815, 913, 928, 605, 1516, 1219, 1624)
# 线性回归拟合
lmod <- lm(
    y ~ x # 默认有截距项
)
# 输出结果
print(summary(lmod))
# 参数的置信区间
conf_res <- confint(
    lmod, # 模型
    level = 0.95 # 置信水平
)
print(conf_res)
# 保存工作空间
save.image("R2.RData")
